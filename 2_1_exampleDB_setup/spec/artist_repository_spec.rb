require "artist_repository"

def reset_artist_table
  seed_sql = File.read("spec/seeds_music_library.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "music_library_test" })
  connection.exec(seed_sql)
end

RSpec.describe ArtistRepository do
  before(:each) do
    reset_artist_table
  end
  describe "#all" do
    it "initially has 4 artists" do
      repo = ArtistRepository.new
      artists = repo.all
      expect(artists.length).to eq 4
    end
    it "initially has correct data for first artist" do
      repo = ArtistRepository.new
      artist = repo.all.first
      expect(artist.id).to eq 1
    end
  end

  describe "#find" do
    it "can return the record with id 2" do
      repo = ArtistRepository.new
      expect(repo.find(2).id).to eq 2
    end
  end

  describe "#find_with_albums" do
    it "returns a list of all albums by 'Nina Simone'" do
      repo = ArtistRepository.new
      result = repo.find_with_albums("Nina Simone")
      expect(result.id).to eq 4
      expect(result.name).to eq "Nina Simone"
      albums = result.albums.map { |el| el.title }
      expect(albums).to eq ["I Put a Spell on You", "Baltimore", "Here Comes the Sun", "Fodder on My Wings"]
    end
  end

  describe "#create" do
    it "creates a record and finds it at end of list of all records" do
      repo = ArtistRepository.new
      new_artist = double :fake_artist, id: 1, name: "Iron Maiden", genre: "Heavy Metal"
      repo.create(new_artist)
      records = repo.all
      expect(records.length).to eq 5
      expect(records.last.name).to eq "Iron Maiden"
      expect(repo.find(5).name).to eq "Iron Maiden"
    end
  end
end

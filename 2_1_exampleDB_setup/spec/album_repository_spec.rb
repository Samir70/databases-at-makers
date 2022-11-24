require "album_repository"

def reset_albums_table
  seed_sql = File.read("spec/seeds_music_library.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "music_library_test" })
  connection.exec(seed_sql)
end

RSpec.describe AlbumRepository do
  before(:each) do
    reset_albums_table
  end
  describe "#all" do
    it "initially has 12 albums" do
      ml = AlbumRepository.new
      albums = ml.all
      expect(albums.length).to eq 12
    end
    it "has correct data for first album" do
      ml = AlbumRepository.new
      albums = ml.all
      expect(albums.first.id).to eq 1
      expect(albums.first.title).to eq "Doolittle"
      expect(albums.first.release_year).to eq 1989
      expect(albums.first.artist_id).to eq 1
    end
  end

  describe "#find" do
    it "can return the album with id 4" do
      ml = AlbumRepository.new
      expect(ml.find(4).id).to eq 4
    end
    it "returns nil if no album with given id" do
      ml = AlbumRepository.new
      expect(ml.find(44)).to eq nil
    end
  end

  describe "#create" do
    it "creates a new record and finds it with id of 13" do
      new_album = double :fake_album, title: "Seventh Son of a Seventh Son", release_year: 1756, artist_id: 5
      ml = AlbumRepository.new
      ml.create(new_album)
      expect(ml.find(13).title).to eq "Seventh Son of a Seventh Son"
    end
  end
end

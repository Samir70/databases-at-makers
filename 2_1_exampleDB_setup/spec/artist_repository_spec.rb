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

    it "initially has 4 artists" do
        repo = ArtistRepository.new
        artists = repo.all
        expect(artists.length).to eq 4
    end
    it "initially has correct data for first artist" do
        repo = ArtistRepository.new
        artists = repo.all
        expect(artists.first.id).to eq '1'
    end
    it "can return the record with id 2" do
        repo = ArtistRepository.new
        expect(repo.find(2).id).to eq '2'
    end
end
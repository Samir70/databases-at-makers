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

  it "initially has 12 albums" do
    ml = AlbumRepository.new
    albums = ml.all
    expect(albums.length).to eq 12
  end
  it "has correct data for first album" do
    ml = AlbumRepository.new
    albums = ml.all
    expect(albums.first.id).to eq '1'
    expect(albums.first.title).to eq 'Doolittle'
    expect(albums.first.release_year).to eq '1989'
    expect(albums.first.artist_id).to eq '1'
  end
  it "can return the album with id 4" do
    ml = AlbumRepository.new
    expect(ml.find(4).id).to eq '4'
  end
  it "returns nil if no album with given id" do
    ml = AlbumRepository.new
    expect(ml.find(44)).to eq nil
  end
end

require_relative "../app"

RSpec.describe Application do
  before(:each) do
    @io = double :fake_io
    @album_repo = double :fake_album_repository
    @artist_repo = double :fake_artist_repository
    @app = Application.new("music_library_test", @io, @album_repo, @artist_repo)
  end
  it "initialises" do
    # expect(DatabaseConnection).to receive(connect).with('music_library_test')
    expect(@app.io).to eq @io
    expect(@app.album_repository).to eq @album_repo
    expect(@app.artist_repository).to eq @artist_repo
  end

  it "runs asks user which table to display" do
    expect(@io).to receive(:puts).with("Welcome to the music library manager!").ordered
    expect(@io).to receive(:puts).with("").ordered
    expect(@io).to receive(:puts).with("What would you like to do?").ordered
    expect(@io).to receive(:puts).with("1 - List all albums").ordered
    expect(@io).to receive(:puts).with("2 - List all artists").ordered
    expect(@io).to receive(:puts).with("3 - Find albums by an artist").ordered
    expect(@io).to receive(:puts).with("").ordered
    expect(@io).to receive(:print).with("Enter your choice:").ordered
    allow(@io).to receive(:gets).at_least(:once)
    allow(@io).to receive(:puts).at_least(:once)
    allow(@artist_repo).to receive(:all).and_return([])
    @app.run
  end
  it "lists the albums if user types '1'" do
    album_1 = double :fake_album, id:1, title:"title 1"
    album_2 = double :fake_album, id:2, title:"title 2"
    expect(@io).to receive(:puts).exactly(7).times.ordered
    expect(@io).to receive(:print).exactly(:once).ordered
    expect(@io).to receive(:gets).and_return("1").ordered
    expect(@album_repo).to receive(:all).and_return [album_1, album_2]
    expect(@io).to receive(:puts).with("1 - title 1").ordered
    expect(@io).to receive(:puts).with("2 - title 2").ordered
    @app.run
  end
  it "lists the artists if user types '2'" do
    artist_1 = double :fake_artist, id:1, name:"name 1", genre: "genre 1"
    artist_2 = double :fake_artist, id:2, name:"name 2", genre: "genre 2"
    expect(@io).to receive(:puts).exactly(7).times.ordered
    expect(@io).to receive(:print).exactly(:once).ordered
    expect(@io).to receive(:gets).and_return("2").ordered
    expect(@artist_repo).to receive(:all).and_return [artist_1, artist_2]
    expect(@io).to receive(:puts).with("1 - name 1 (genre 1)").ordered
    expect(@io).to receive(:puts).with("2 - name 2 (genre 2)").ordered
    @app.run
  end
  it "lists albums by named artist if user selcted '3'" do
    album_1 = double :fake_album, id:1, title:"title 1", release_year:1975, artist_name: 'Paul Simon'
    album_2 = double :fake_album, id:4, title:"title 2", release_year:1974, artist_name: 'Paul Simon'
    artist_1 = double :fake_artist, id:1, name:"Paul Simon", genre: "genre 1", albums: [album_1, album_2]
    allow(artist_1).to receive(:to_s).and_return "Paul Simon has 2 albums\ntitle 1, title 2,"
    expect(@io).to receive(:puts).exactly(7).times.ordered
    expect(@io).to receive(:print).with("Enter your choice:").ordered
    expect(@io).to receive(:gets).and_return("3").ordered
    expect(@io).to receive(:print).with("Enter the name of an artist: ").ordered
    expect(@io).to receive(:gets).and_return("Paul Simon").ordered
    expect(@artist_repo).to receive(:find_with_albums).with("Paul Simon").and_return(artist_1)
    expect(@io).to receive(:puts).with("Paul Simon has 2 albums\ntitle 1, title 2,").ordered
    @app.run
  end
end

require_relative "./lib/album_repository"
require_relative "./lib/artist_repository"
require_relative "./lib/database_connection"

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  attr_reader :io, :album_repository, :artist_repository

  def run
    @io.puts "Welcome to the music library manager!"
    @io.puts ""
    @io.puts "What would you like to do?"
    @io.puts "1 - List all albums"
    @io.puts "2 - List all artists"
    @io.puts ""
    @io.print "Enter your choice:"
    choice = @io.gets.to_i
    if choice == 1
      show_albums
    else
      show_artists
    end
  end

  private
  def show_albums
    albums = @album_repository.all
    albums.each { |el| @io.puts "#{el.id} - #{el.title}" }
  end
  def show_artists
    artists = @artist_repository.all
    artists.each { |el| @io.puts "#{el.id} - #{el.name} (#{el.genre})" }
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    "music_library",
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end

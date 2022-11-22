require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

artist_repo = ArtistRepository.new
album_repo = AlbumRepository.new
artists = artist_repo.all
def add_artist_name(album, artists)
  album.artist_name = artists[album.artist_id.to_i - 1].name
end

# albums = album_repo.all.each { |album| add_artist_name(album, artists)}
puts "Give me an id number to look for"
id = gets.to_i
album = album_repo.find(id)
if album == nil
  puts "Sorry, no album with that id"
else
  add_artist_name(album, artists)
  puts album
end

# Print out each record from the result set .
# albums.each do |record|
#   print record, "\n"
# end
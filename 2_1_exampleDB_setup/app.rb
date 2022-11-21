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
albums = album_repo.all.each { |album| album.artist_name = artists[album.artist_id.to_i - 1].name}

# Print out each record from the result set .
albums.each do |record|
  print record, "\n"
end
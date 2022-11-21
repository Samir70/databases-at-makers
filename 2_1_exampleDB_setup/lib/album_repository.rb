require 'album'
class AlbumRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;

    # Returns an array of album objects.

    albums = []
    sql = "SELECT id, title, release_year, artist_id FROM albums;"
    results = DatabaseConnection.exec_params(sql, [])
    results.each do |record|
      album = Album.new
      album.id = record["id"]
      album.title = record["title"]
      album.release_year = record["release_year"]
      album.artist_id = record["artist_id"]
      albums << album
    end
    return albums
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;

    # Returns a single Student object.
  end

  # Add more methods below for each operation you'd like to implement.

  def create(album)
    # adds album to the table
    # INSERT INTO albums (title, release_year, artist_id) VALUES (album.title, album.release_year, album.artist_id)
  end

  def update(album)
    # UPDATE albums SET (title, release_year, artist_id) = (album.title, album.release_year, album.artist_id) WHERE id = album.id
  end

  def delete(album)
    # DELETE albums WHERE id = album.id
  end
end

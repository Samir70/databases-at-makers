require_relative "album"

class AlbumRepository
  def all
    sql = "SELECT id, title, release_year, artist_id FROM albums;"
    results = DatabaseConnection.exec_params(sql, [])
    return results.map { |el| make_album(el) }
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

  private

  def make_album(hash)
    album = Album.new
    album.id = hash["id"]
    album.title = hash["title"]
    album.release_year = hash["release_year"]
    album.artist_id = hash["artist_id"]
    return album
  end
end

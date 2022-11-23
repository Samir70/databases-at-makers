require_relative "album"

class AlbumRepository
  def all
    sql = "SELECT id, title, release_year, artist_id FROM albums;"
    results = DatabaseConnection.exec_params(sql, [])
    return make_album(results)
  end
  
  def find(id)
    sql =  "SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;"
    results = DatabaseConnection.exec_params(sql, [id])
    return make_album(results)[0]
  end

  def create(album)
    sql = "INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3)" 
    DatabaseConnection.exec_params(sql, [album.title, album.release_year, album.artist_id])
  end

  def update(album)
    # UPDATE albums SET (title, release_year, artist_id) = (album.title, album.release_year, album.artist_id) WHERE id = album.id
  end

  def delete(album)
    # DELETE albums WHERE id = album.id
  end

  private

  def make_album(arr_of_hash)
    return arr_of_hash.map { |el| Album.new(el)}
  end
end

require_relative "artist"

class ArtistRepository
  def all
    sql = "SELECT id, name, genre FROM artists;"
    results = DatabaseConnection.exec_params(sql, [])
    return make_artist(results)
  end
  
  def find(id)
    sql = "SELECT id, name, genre FROM artists WHERE id = $1;"
    results = DatabaseConnection.exec_params(sql, [id])
    return make_artist(results)[0]
  end

  def create(artist)
    sql = "INSERT INTO artists (name, genre) VALUES ($1, $2)"
    params = [artist.name, artist.genre]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def update(artist)
    # UPDATE artists SET (name, genre) WHERE id = artist.id
  end

  def delete(artist)
    # DELETE artists WHERE id = artist.id
  end

  private

  def make_artist(arr_of_hash)
    return arr_of_hash.map { |el| Artist.new(el) }
  end
end

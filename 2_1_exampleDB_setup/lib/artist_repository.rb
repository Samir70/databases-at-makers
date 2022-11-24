require_relative "artist"
require_relative "album"

class ArtistRepository
  def all
    sql = "SELECT id, name, genre FROM artists;"
    results = DatabaseConnection.exec_params(sql, [])
    return results.map { |el| Artist.new(el) }
  end

  def find(id)
    sql = "SELECT id, name, genre FROM artists WHERE id = $1;"
    results = DatabaseConnection.exec_params(sql, [id])
    return results.map { |el| Artist.new(el) }[0]
  end

  def find_with_albums(artist_name)
    sql = "SELECT artists.id, artists.name, artists.genre,
                  albums.id as album_id, albums.title, albums.release_year, albums.artist_id
              FROM albums JOIN artists 
              ON artist_id = artists.id 
              WHERE name = $1;"
    results = DatabaseConnection.exec_params(sql, [artist_name])
    artist = Artist.new(results.first)
    results.each do |result|
      result["id"] = result["album_id"]
      artist.add_album(Album.new(result))
    end
    return artist
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
end

require_relative "artist"

class ArtistRepository
  def all
    sql = "SELECT id, name, genre FROM artists;"
    results = DatabaseConnection.exec_params(sql, [])
    return results.map { |el| make_artist(el) }
  end
  
  def find(id)
    sql = "SELECT id, name, genre FROM artists WHERE id = $1;"
    results = DatabaseConnection.exec_params(sql, [id])
    return results.map { |el| make_artist(el) }[0]
  end

  # Add more methods below for each operation you'd like to implement.

  def create(artist)
    # adds artist to the table
    # INSERT INTO artists (id, name, genre) VALUES (artist.id, artist.name, artist.genre)
  end

  def update(artist)
    # UPDATE artists SET (name, genre) WHERE id = artist.id
  end

  def delete(artist)
    # DELETE artists WHERE id = artist.id
  end

  private

  def make_artist(hash)
    artist = Artist.new
    artist.id = hash["id"]
    artist.name = hash["name"]
    artist.genre = hash["genre"]
    return artist
  end
end

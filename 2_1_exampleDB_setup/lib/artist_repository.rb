class ArtistRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;

    # Returns an array of Artist objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists WHERE id = $1;

    # Returns a single Student object.
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
end

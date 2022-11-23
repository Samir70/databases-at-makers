class Artist
  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @genre = hash["genre"]
  end

  attr_accessor :id, :name, :genre
end

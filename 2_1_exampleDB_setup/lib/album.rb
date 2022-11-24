class Album
  def initialize(hash)
    @id = hash["id"].to_i
    @title = hash["title"]
    @artist_name = hash["name"]
    @release_year = hash["release_year"].to_i
    @artist_id = hash["artist_id"].to_i
  end
  def to_s
    return "The album #{@title} by #{@artist_name} was released in #{@release_year}"
  end

  attr_accessor :id, :title, :release_year, :artist_id, :artist_name
end

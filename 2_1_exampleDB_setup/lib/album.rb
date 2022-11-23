class Album
  def initialize(hash)
    @id = hash["id"]
    @title = hash["title"]
    @release_year = hash["release_year"]
    @artist_id = hash["artist_id"]
  end
  def to_s
    return "The album #{@title} by #{@artist_name} was released in #{@release_year}"
  end

  attr_accessor :id, :title, :release_year, :artist_id, :artist_name
end

class Album
  def to_s
    return "The album #{@title} by #{@artist_name} was released in #{@release_year}"
  end

  attr_accessor :id, :title, :release_year, :artist_id, :artist_name
end

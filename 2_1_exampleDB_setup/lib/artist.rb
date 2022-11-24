class Artist
  def initialize(hash)
    @id = hash["id"].to_i
    @name = hash["name"]
    @genre = hash["genre"]
    @albums = []
  end

  def add_album(album)
    @albums << album
  end

  def to_s
    out =  "#{@name} has #{@albums.length} albums\n"
    @albums.each {|album| out =  out + album.title + ", "}
    return out
  end
  attr_reader :id, :name, :genre, :albums
end

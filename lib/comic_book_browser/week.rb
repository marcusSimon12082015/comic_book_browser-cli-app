class ComicBookBrowser::Week
  attr_accessor :release_day, :url, :comics
  @@all = []
  def initialize(day,url)
    @release_day = day
    @url = url
    @@all << self
    @comics = []
  end
end

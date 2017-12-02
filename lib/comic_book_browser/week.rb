class ComicBookBrowser::Week
  attr_accessor :release_day, :url, :comics
  @@all = []
  def initialize(day,url)
    @release_day = day
    @url = url
    @@all << self
    @comics = []
  end
  def self.get_current_week
    week_index = @@all.each_with_index.min_by{|index, week| week.url.length}
    week_index.last
  end
  def add_comics(comics)
    @comics = comics
  end 
end

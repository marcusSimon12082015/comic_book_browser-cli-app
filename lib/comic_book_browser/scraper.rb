class ComicBookBrowser::Scraper
  @@BASE_URL = "https://leagueofcomicgeeks.com"

  def self.scrape_release_weeks
    weeks = []
    #we get all available release weeks of the comics page to
    #display to the user
    @doc = Nokogiri::HTML(open(@@BASE_URL+"/comics"))
    release_dates = @doc.search(".panel-body ul li")
    release_dates.each_with_index do |release_date, index|
      release_day = release_date.search('a').text
      url = release_date.at('a')['href']
      week = ComicBookBrowser::Week.new(release_day,url)
      weeks << week
    end
    weeks
    binding.pry
  end
end

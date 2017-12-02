class ComicBookBrowser::Scraper
  @@BASE_URL = "https://leagueofcomicgeeks.com"

  def self.scrape_release_weeks
    weeks = []
    #we get all available release weeks of the comics page to
    #display to the user
    @doc = Nokogiri::HTML(open(@@base_url+"/comics"))
    
  end
end

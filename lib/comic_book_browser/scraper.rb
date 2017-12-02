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
  end
  #based on week URL we scrape all the comic books that were released on the date
  #we extract the title,publisher and price
  def self.scrape_comics_list(week_url)
      comics = []
      @doc = Nokogiri::HTML(open(@@BASE_URL+week_url))
      comic_list =
        @doc.search(".col-main #comic-list-block #comic-list div.media-body.comic-summary")
      comic_list.each_with_index do |comic, index|
        title = comic.search("div.comic-title a").text
        publisher = comic.search("div.comic-details strong").text
        url = comic.at('a')['href']
        price = comic.search("div.comic-details").text.split('$')[-1]
        #if price is not a number we tell the user that price is not set yet
        if price.to_i == 0
          price = "Price to be announced"
        else
          price = "$#{price}"
        end
        comic_obj = ComicBookBrowser::Comic.new(title,publisher,price,url)
        comics << comic_obj
      end
      comics
  end

  def self.scrape_comic_details(comic)
    @doc = Nokogiri::HTML(open(@@BASE_URL+comic.url))
    comic_description = @doc.search(".listing-description")
    #COMIC description
    comic.description = comic_description.search("p").text.strip
    comic_authors = @doc.search(".credits-list")
    authors = comic_authors.search(".credits-list-right")
    authors.each do |author|
      comic.authors << author.search("div a").text
    end
    comic
  end
end

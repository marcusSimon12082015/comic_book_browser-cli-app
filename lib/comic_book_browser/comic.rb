class ComicBookBrowser::Comic
  attr_accessor :title, :publisher, :description, :price, :url, :authors
  @@all = []
  def initialize(title,publisher,price,url,description=nil)
    @title = title
    @publisher = publisher
    @price = price
    @url = url
    @@all << self
    @description = description
    @authors = []
  end
end 

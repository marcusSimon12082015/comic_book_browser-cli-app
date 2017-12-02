class ComicBookBrowser::ComicsTableView
  include CommandLineReporter
  def display_comics(comics)
    table border:true do
      row header:true, color:'red' do
        column '#'
        column 'TITLE', width:60
        column 'PUBLISHER',width:30
        column 'PRICE',width:25
      end
      comics.each_with_index do |comic,index|
        row do
          column index+1
          column comic.title
          column comic.publisher
          column comic.price
        end
      end
    end
  end
end 

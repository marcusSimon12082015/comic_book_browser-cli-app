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

  def display_comic(comic)
    header title: 'COMIC BOOK DETAILS'.green
    table border:true do
      row do
        column 'TITLE',width:50, color:'red'
        column comic.title, width:70
      end
      row do
        column 'PUBLISHER', width:50, color:'red'
        column comic.publisher, width:70
      end
      row do
        column 'PRICE', width:50, color:'red'
        column comic.price, width:70
      end
      row do
        column 'DESCRIPTION', width:50, color:'red'
        column comic.description.gsub(/\t/,''), width:70
      end
      row do
        column 'AUTHORS', width:50, color:'red'
        column comic.authors.join(", "), width:70
      end
    end
  end
end

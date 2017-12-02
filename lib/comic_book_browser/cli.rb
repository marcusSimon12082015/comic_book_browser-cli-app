class ComicBookBrowser::CLI

  def initialize
    @table_view = ComicBookBrowser::ComicsTableView.new
  end

  def call
    list_weeks
    menu
    goodbye
  end

  def list_weeks
    puts "BROWSE COMIC BOOK RELEASES:".red
    @weeks = ComicBookBrowser::Scraper.scrape_release_weeks
    current_week_index = ComicBookBrowser::Week.get_current_week
    @weeks.each_with_index do |week, i|
      if current_week_index == i
        puts "#{i+1}. #{week.release_day}".green
      else
        puts "#{i+1}. #{week.release_day}"
      end
    #binding.pry
    end
  end

  def list_comics(week_url,input)
    week = @weeks[input-1]
    puts "ALL COMICS RELEASED FOR #{week.release_day}"

    week.add_comics(ComicBookBrowser::Scraper.scrape_comics_list(week_url))
    #using command_line_reporter_gem
    @table_view.display_comics(week.comics)
  end

  def list_comic_details(comic)
    comic = ComicBookBrowser::Scraper.scrape_comic_details(comic)
    #using command_line_reporter Gem
    @table_view.display_comic(comic)
  end

  def menu
    input = nil
    while input != "exit"
      puts "Select a week to explore or type exit to quit:"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @weeks.length
        week = @weeks[input.to_i-1]
        list_comics(week.url,input.to_i)

        #get comic book details
        comic_choice = nil
        while comic_choice != "q"
          puts "Select comic book number to explore details about the comic!Or Type q to go back to weeks menu"
          comic_choice = gets.strip.downcase
          if comic_choice.to_i > 0 && comic_choice.to_i <= week.comics.length
            comic = week.comics[comic_choice.to_i-1]
            list_comic_details(comic)
          elsif comic_choice == "q"
            list_weeks
            break
          else
            puts "Not a valid comic book selection, Try Again"
          end
        end
      elsif input == "exit"
        break
      else
        puts "Not sure what you want, type vaild week number or exit."
      end
    end
  end
  def goodbye
    puts "Bye, see you next Time!"
  end
end

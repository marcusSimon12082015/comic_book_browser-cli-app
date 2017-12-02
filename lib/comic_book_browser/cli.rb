class ComicBookBrowser::CLI
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
  def menu
    input = nil
    while input != "exit"
      puts "Select a week to explore or type exit to quit:"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @weeks.length
        puts "You choose week #{input.to_i}"
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

class ComicBookBrowser::CLI
  def call
    list_weeks
    menu
  end

  def list_weeks
    puts "BROWSE COMIC BOOK RELEASES:"
  end
  def menu
    input = nil
    while input != "exit"
      puts "Select a week to explore or type exit to quit:"
      input = gets.strip.downcase
    end
  end
  def goodbye
    puts "Bye, see you next Time!"
  end
end

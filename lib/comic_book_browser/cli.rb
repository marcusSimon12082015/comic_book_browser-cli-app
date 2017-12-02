class ComicBookBrowser::CLI
  def call
    list_weeks
    menu
  end

  def list_weeks

  end
  def menu
    input = nil
    while input != "exit"
      puts "Select a week to explore or type exit to quit:"
      input = gets.strip.downcase

  end
end

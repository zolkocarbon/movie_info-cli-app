class MovieInfo::CLI

  def call
    MovieInfo::Movie.new
    start
  end

  def start
    list
    input = nil
    while input != "exit"
      puts "Please enter a menu number to see movie plot."
      puts "To see the list again, enter 'list'."
      puts "To exit the program, enter 'exit'."
      input = gets.strip.downcase
      if input.between?(1..MovieInfo::Movie.all-1)
        scrape_plot(input)
      elsif input == "list"
        list
      elsif input != "exit"
        puts "The input you entered is not valid."
      end
    end
    puts "Have a nice day."
  end

end



end

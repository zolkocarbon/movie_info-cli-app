class MovieInfo::CLI

  def call
    MovieInfo::Movie.new
    start
  end

  def list
    puts "AMC Theaters Feature Movies"
    MovieInfo::Movie.all.each.with_index(1) do |movie_instance, i|
      puts "#{i}. #{movie_instance.title}"
    end
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
        movie_plot(input) #will call scrape_plot
      elsif input == "list"
        list
      elsif input != "exit"
        puts "The input you entered is not valid."
      end
    end
    puts "Have a nice day."
  end

end

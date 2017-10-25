class MovieInfo::CLI

  def call
    MovieInfo::Scraper.make_movie
    start
  end

  def list
    puts "These are the feature movies at our theater."
    MovieInfo::Movie.all.each.with_index(1) do |movie_instance, i|
      puts "#{i}. #{movie_instance.title}"
    end
  end

  def start
    puts "Welcome to AMC Theaters"
    list
    input = nil
    while input != "exit"
      puts "Please enter a menu number to see movie plot."
      puts "To see the list again, enter 'list'."
      puts "To exit the program, enter 'exit'."
      input = gets.strip.downcase
      if input.to_i.between?(1, MovieInfo::Movie.all.length-1)
        movie = MovieInfo::Movie.find_movie(input.to_i)
        movie.movie_details
        puts "Movie Details - #{movie.title}"
        puts "Plot: #{movie.plot}"
        puts "Duration: #{movie.duration}"
        puts "-------------------------------------------------"
      elsif input == "list"
        list
      end
    end
    puts "Have a nice day."
  end

end

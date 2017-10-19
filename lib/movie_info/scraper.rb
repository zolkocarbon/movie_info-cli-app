class MovieInfo::Scraper

#Get HTML from page
  def self.scrape_page
    Nokogiri::HTML(open("https://www.amctheatres.com/movies"))
  end

#Select elements containing data needed to crate each movie and place
#each match into array element
  def self.movies_array
    self.scrape_page.css("div.MoviePostersGrid-poster")
  end

#for each array element make an instance of the movie_data
#passing in the title and url to movie instance initialize as arguments
  def self.make_movie
    movies_array.each do |m|
      MovieInfo::Movie.new(
      m.css("h3").text,
      "https://www.amctheatres.com#{m.css("a").attr("href").text}"
      )
    end
  end

  def self.scrape_plot(link)
    plot = Nokogiri::HTML(open(link)).css("div.Intro-text p").text
    #binding.pry
  end

end

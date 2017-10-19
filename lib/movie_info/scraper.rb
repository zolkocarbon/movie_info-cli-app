class MovieInfo::Scraper

#Get HTML from page
  def scrape_page
    Nokogiri::HTML(open("https://www.amctheatres.com/movies"))
  end

#Select elements containing data needed to crate each movie and place
#each match into array element
  def movie_array
    scrape_page.css("div.PosterSlide")
  end

#for each array element make an instance of the movie_data
#passing in the title and url to movie instance initialize as arguments
  def make_movie
    movies_array.each do |m|
      MovieInfo::Movie.new(
      m.css("div.MoviePostersGrid-text h3").text,
      "https://www.amctheatres.com/movies#{m.css("div.PosterSlide a.Link").attribute("href").text}"
      )
    end
  end

end

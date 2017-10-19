class MovieInfo::Scraper

  def scrape_page
    Nokogiri::HTML(open("https://www.amctheatres.com/movies"))
  end

  def movie_array
    scrape_page.css("div.PosterSlide")
  end

  def make_movie
    movies_array.each do |m|
      MovieInfo::Movie.new(
      m.css("div.MoviePostersGrid-text h3").text,
      "https://www.amctheatres.com/movies#{m.css("div.PosterSlide a.Link").attribute("href").text}"
      )
    end
  end

end

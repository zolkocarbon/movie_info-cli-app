require 'pry'

class MovieInfo::Movie

  attr_accessor :title, :link, :plot, :duration
  @@all = [] #holds all the movie instances

  def initialize(title, link)
    @title = title
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_movie(input)
    self.all[input-1]
  end

  def movie_details
    movie_details = MovieInfo::Scraper.scrape_movie_details(self.link)
    #binding.pry
    @plot = movie_details.css("div.Intro-text p").text
    @duration = movie_details.css("li.Headline--eyebrow span.u-separator").text
  end

end

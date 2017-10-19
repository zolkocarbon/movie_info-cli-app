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

  def plot
    @plot ||= MovieInfo::Scraper.scrape_plot(self.link)
  end

end

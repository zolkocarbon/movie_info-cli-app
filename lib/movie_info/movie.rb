
class MovieInfo::Movie

  attr_accessor :title, :link, :plot, :duration

  def initialize(title, link)
    @title = title
    @link = link
  end

end
#Main page to scrape: https://www.amctheatres.com/movies
#Selector to scrape movies:

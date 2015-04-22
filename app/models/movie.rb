class Movie < ActiveRecord::Base
  has_many :playdates

  def movie_at_formatted
    self.movie_at.strftime("%A, %B %d, at %I:%M %p")
  end

end

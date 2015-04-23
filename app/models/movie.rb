class Movie < ActiveRecord::Base
  has_many :playdates

  def movie_at_formatted
    self.movie_at.strftime("%A, %B %d, at %I:%M %p")
  end

  def description_clipped
    self.description[0..150].gsub(/\s\w+\s*$/, '...')
  end

  def rating_formatted
    return "#{self.rating} out of 100"
  end

end

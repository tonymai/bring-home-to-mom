class Experience < ActiveRecord::Base
  has_many :playdates

  def self.upcoming_experiences # returns next 10 experiences, sorted
    Experience.where(experience_at: Time.now..(Time.now + 1.year)).reorder('experience_at')[0..9]
  end

  def experience_at_formatted
    self.experience_at.strftime("%A, %B %d, at %I:%M %p")
  end

end

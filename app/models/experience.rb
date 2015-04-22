class Experience < ActiveRecord::Base
  has_many :playdates

  def self.upcoming_experiences # returns next 10 experiences, sorted
    Experience.where(experience_at: Time.now..(Time.now + 1.year)).reorder('experience_at')[0..9]
  end

end

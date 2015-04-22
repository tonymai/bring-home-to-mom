class Movie < ActiveRecord::Base
  has_many :playdates
end

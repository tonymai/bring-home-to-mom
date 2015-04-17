class Interest < ActiveRecord::Base
  has_many :children_interests
  has_many :children, through: :children_interests
end

class Value < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :children_interests
  has_many :children, through: :children_interests
end

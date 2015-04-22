class Message < ActiveRecord::Base
  belongs_to :playdate
  belongs_to :parent

  validates :body, :playdate_id, :parent_id, presence: true
end

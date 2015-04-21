class Playdate < ActiveRecord::Base
  belongs_to :initiator, class_name: 'Child'
  belongs_to :recipient, class_name: 'Child'

  validates :initiator_id, :recipient_id, presence: true
end

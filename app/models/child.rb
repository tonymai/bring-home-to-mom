class Child < ActiveRecord::Base
  belongs_to :parent

  has_many :children_interests
  has_many :interests, through: :children_interests

  has_many :initiated_playdates, class_name: 'Playdate', foreign_key: 'initiator_id'
  has_many :recipients, through: :initiated_playdates
  has_many :received_playdates, class_name: 'Playdate', foreign_key: 'recipient_id'
  has_many :initiators, through: :received_playdates

end

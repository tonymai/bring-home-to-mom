class Child < ActiveRecord::Base
  before_validation :set_main_profile_image

  belongs_to :parent

  has_many :children_interests
  has_many :interests, through: :children_interests

  has_many :initiated_playdates, class_name: 'Playdate', foreign_key: 'initiator_id'
  has_many :recipients, through: :initiated_playdates
  has_many :received_playdates, class_name: 'Playdate', foreign_key: 'recipient_id'
  has_many :initiators, through: :received_playdates

  validates :first_name, :last_name, :city, :state, :phone, :gender, :sexual_preference, :birthdate, :bio, :main_profile_image, presence: true
  validates :phone, uniqueness: true

  private

  def set_main_profile_image
    case
    when pf_image_1
      self.main_profile_image = 1
    when pf_image_2
      self.main_profile_image = 2
    when pf_image_3
      self.main_profile_image = 3
    when pf_image_4
      self.main_profile_image = 4
    when pf_image_5
      self.main_profile_image = 5
    end
  end
end




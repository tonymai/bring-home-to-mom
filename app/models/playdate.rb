class Playdate < ActiveRecord::Base
  belongs_to :initiator, class_name: 'Child'
  belongs_to :recipient, class_name: 'Child'
  belongs_to :experience
  belongs_to :movie

  validates :initiator_id, :recipient_id, presence: true

  # Conversation-specific block
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :initiator_id, scope: :recipient_id

  scope :involving, -> (user) do
    where("conversations.initiator_id =? OR conversations.recipient_id =?",user.id,user.id)
  end

  scope :between, -> (initiator_id,recipient_id) do
    where("(conversations.initiator_id = ? AND conversations.recipient_id =?) OR (conversations.initiator_id = ? AND conversations.recipient_id =?)", initiator_id,recipient_id, recipient_id, initiator_id)
  end
  # End conversation-specific block

  def total_cost_per_person
    self.experience.nil? ? experience_cost = 0 : experience_cost = self.experience.price_per_person
    self.movie.nil? ? movie_cost = 0 : movie_cost = self.movie.price_per_person
    total_cost = experience_cost + movie_cost
  end

  def calendar_date_as_string
    self.playdate_at.nil? ? "To Be Determined" : self.playdate_at.strftime("%A, %B %d, %Y")
  end

  def both_parents_accepted?
    return self.recipient_accepted #implicit that the initiator has accepted
  end

  def both_parents_confirmed? #this also implies they have both paid
    if both_parents_accepted?
      return (self.initiator_confirmed && self.recipient_confirmed)
    else
      return false
    end
  end

  def both_parents_paid?
    if (both_parents_accepted? && both_parents_confirmed?) #ensure other two conditions are already met
      return (self.initiator_paid && self.recipient_paid)
    else
      return false
    end
  end

  def status #order is important here
    if both_parents_paid?
      return 'paid'
    elsif both_parents_confirmed?
      return 'confirmed'
    elsif both_parents_accepted?
      return 'accepted'
    else
      return 'pending'
    end
  end

  def playdate_at #returns datetime of earliest event (movie or experience)
    self.experience.nil? ? experience_datetime = 0 : experience_datetime = self.experience.experience_at
    self.movie.nil? ? movie_datetime = 0 : movie_datetime = self.movie.experience_at
    playdate_datetime = [experience_datetime, movie_datetime].min
  end

end

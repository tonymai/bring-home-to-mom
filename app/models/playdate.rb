class Playdate < ActiveRecord::Base
  belongs_to :initiator, class_name: 'Child'
  belongs_to :recipient, class_name: 'Child'

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

  def budget_as_string
    self.budget.nil? ? "To Be Determined" : "$#{self.budget}"
  end

  def calendar_date_as_string
    self.playdate_at.nil? ? "To Be Determined" : self.playdate_at.strftime("%A, %B %d, %Y")
  end

end

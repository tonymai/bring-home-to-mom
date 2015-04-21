class Playdate < ActiveRecord::Base
  belongs_to :initiator, class_name: 'Child'
  belongs_to :recipient, class_name: 'Child'

  validates :initiator_id, :recipient_id, presence: true

  def budget_as_string
    self.budget.nil? ? "To Be Determined" : "$#{self.budget}"
  end

  def calendar_date_as_string
    self.playdate_at.nil? ? "To Be Determined" : self.playdate_at.strftime("%A, %B %d, %Y")
  end

end

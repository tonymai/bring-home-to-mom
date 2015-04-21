class Playdate < ActiveRecord::Base
  belongs_to :initiator, class_name: 'Child'
  belongs_to :recipient, class_name: 'Child'
  belongs_to :experience
  belongs_to :movie

  validates :initiator_id, :recipient_id, presence: true

  def budget_as_string
    self.budget.nil? ? "To Be Determined" : "$#{self.budget}"
  end

  def calendar_date_as_string
    self.playdate_at.nil? ? "To Be Determined" : self.playdate_at.strftime("%A, %B %d, %Y")
  end

  def both_parents_accepted?
    return (self.initiator_accepted && self.recipient_accepted)
  end

  def both_parents_confirmed? #this also implies they have both paid
    if both_parents_accepted?
      return (self.initiator_confirmed && self.recipient_confirmed)
    else
      return false
    end
  end

  def update_date_status
    if both_parents_confirmed?
      self.update(status: 'confirmed')
    elsif both_parents_accepted?
      self.update(status: 'accepted')
    else
      self.update(status: 'pending')
    end
  end

end

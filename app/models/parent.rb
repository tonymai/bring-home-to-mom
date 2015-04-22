class Parent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :children
	has_many :conversations, :foreign_key => :sender_id

  def initiated_playdates
    initiated_date_objects = []
    self.children.each do |child|
      initiated_date_objects << child.initiated_playdates unless child.initiated_playdates.nil?
    end
    return initiated_date_objects.flatten!
  end

  def received_playdates
    received_date_objects = []
    self.children.each do |child|
      received_date_objects << child.received_playdates unless child.received_playdates.nil?
    end
    return received_date_objects.flatten!
  end

  def playdates
    playdates = []
    playdates << self.initiated_playdates if self.initiated_playdates
    playdates << self.received_playdates if self.received_playdates
    return playdates.flatten!
  end

  def initiated_date?(date_object)
    initiator = date_object.initiator
    recipient = date_object.recipient
    if initiator.parent.id == self.id
      return true
    elsif recipient.parent.id == self.id
      return false
    else
      puts "This parent neither initiated nor received this date"
      return nil
    end
  end

  def pending_dates # only dates awaiting a response from you
    all_pending = self.playdates.select {|date| (date.status == "pending") && (date.recipient_id == self.id)}
  end

  def accepted_dates # planning phase
    self.playdates.select{|date| date.status == "accepted"}
  end

  def upcoming_dates # confirmed and not yet passed
    self.playdates.select{|date| (date.status == "confirmed") && (date.first_event_datetime > Time.now)}.sort_by{|date| date.first_event_datetime}.reverse!
  end

  # def planning_and_upcoming_dates
  #   upcoming_dates = self.playdates.reject{|date| date.event_selected?}.select{|date| (date.status == 'accepted') && (date.first_event_datetime > Time.now)}.sort_by{|date| date.first_event_datetime}.reverse!
  #   planning_dates = self.playdates.select{|date| (date.status == "accepted") && (date.playdate_at.nil?)}
  #   sorted_and_combined_dates = upcoming_dates + planning_dates
  #   return sorted_and_combined_dates
  # end

  def past_dates
    self.playdates.select{|date| (date.status == "confirmed") && (date.first_event_datetime < Time.now)}.sort_by{|date| date.first_event_datetime}.reverse!
    # self.playdates.reject{|date| date.playdate_at.nil?}.select{|date| (date.status == "accepted") && (date.playdate_at < Time.now)}
  end

  def my_child(date_object)
    if date_object.initiator.parent == self
      return date_object.initiator
    elsif date_object.recipient.parent == self
      return date_object.recipient
    else
      puts "That date is not associated with this parent"
      return nil
    end
  end

  def other_child(date_object)
    if date_object.initiator.parent == self
      return date_object.recipient
    elsif date_object.recipient.parent == self
      return date_object.initiator
    else
      puts "That date is not associated with this parent"
      return nil
    end
  end

end

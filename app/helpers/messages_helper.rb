module MessagesHelper
  def self_or_other(message)
    message.parent == current_user ? "self" : "other"
  end
 
  def message_interlocutor(message)
    message.parent == message.playdate.initiator.parent ? message.playdate.initiator : message.playdate.recipient
  end
end
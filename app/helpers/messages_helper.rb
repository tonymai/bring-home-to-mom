module MessagesHelper
  def self_or_other(message)
    message.parent == current_user ? "self" : "other"
  end
 
  def message_interlocutor(message)
    message.parent == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end
end
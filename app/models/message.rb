class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :parent

  validates :body, :conversation_id, :parent_id, presence: true
end

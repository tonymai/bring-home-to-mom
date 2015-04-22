class MessagesController < ApplicationController
  before_filter :authenticate_user!
 
  def create
    @playdate = Playdate.find(params[:date_id])
    @message = @playdate.messages.build(message_params)
    @message.parent_id = current_user.id
    @message.save!
 
    @path = date_path(@playdate)
  end
 
  private
 
  def message_params
    params.require(:message).permit(:body)
  end
end
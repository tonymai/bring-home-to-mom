class UsersController < ApplicationController

  def show #renders the parent's dates dashboard
    @user = Parent.find(params[:id])
    redirect_to user_path(current_user) if current_user != @user 
  end

	def messages
		@users = Parent.all
	end
end

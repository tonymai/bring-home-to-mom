class UsersController < ApplicationController

  def show #renders the parent's dates dashboard
    @user = Parent.find(params[:id])
  end

	def messages
		@users = Parent.all
	end
end

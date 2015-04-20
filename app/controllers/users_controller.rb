class UsersController < ApplicationController

  def show
    @user = Parent.find(params[:id])

    if @user
      render json: { profile: @child, interests: @child.interests, values: @child.values, age: @child.age }, status: :ok
    else
      render json: { error: 'Profile does not exist' }, status: :not_found
    end
  end

	def messages
		@users = Parent.all
	end
end

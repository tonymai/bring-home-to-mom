class WelcomeController < ApplicationController

  def index
    if user_signed_in?
      if current_user.children.length > 0
    	session[:profile_id] = current_user.children.last unless session[:profile_id]
      @current_child = Child.find(session[:profile_id]["id"])
      else
        redirect_to new_user_profile_path(current_user.id)
      end
    end
  end

  def change_child
  	session[:profile_id] = params[:profile_id]
  	current_child = Child.find(params[:profile_id])

  	render json: { profile: current_child }
  end

end

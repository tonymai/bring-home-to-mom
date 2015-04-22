class WelcomeController < ApplicationController

  def index
    if user_signed_in?
    	session[:profile_id] = current_user.children.last.id unless session[:profile_id]
      @current_child = Child.find(session[:profile_id])
    end
  end

  def change_child
    p session
    p "***********************************"
    p params
    p "***********************************"
    session[:profile_id] = params[:profile_id]
  	current_child = Child.find(params[:profile_id])

  	render json: { profile: current_child }
  end

end

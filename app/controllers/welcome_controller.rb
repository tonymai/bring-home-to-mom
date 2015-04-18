class WelcomeController < ApplicationController

  def index
    # redirect_to "/users/#{current_user.id}/profiles" if user_signed_in?
    puts session["flash"]["flashes"]["notice"]
    # byebug
  end


end

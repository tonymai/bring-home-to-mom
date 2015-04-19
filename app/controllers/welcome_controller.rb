class WelcomeController < ApplicationController

  def index
    @first_child = current_user.children.first
  end


end

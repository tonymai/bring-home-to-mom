class FilterController < ApplicationController
  def filter_matches
    p params["user_filters"]
    render json: {}
  end
end

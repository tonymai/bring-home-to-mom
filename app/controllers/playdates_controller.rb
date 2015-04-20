class PlaydatesController < ApplicationController
  def index
  end

  def new
    box_office_movies = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=#{ENV['ROTTEN_TOMATOES_APIKEY']}&limit=10")
  end


  def create
  end
end

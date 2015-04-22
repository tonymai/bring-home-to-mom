class PlaydatesController < ApplicationController
  # require 'awesome_print'
  def index
  end

  def show
    @playdate = Playdate.find(params[:id])
    ##Get IMDB IDs
    box_office_movies = JSON.parse(HTTParty.get("https://bhtm-boxoffice.herokuapp.com"))
    # box_office_movies = JSON.parse(HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=#{ENV['ROTTEN_TOMATOES_APIKEY']}&limit=5"))
    # box_office_movies['movies'] = [] unless box_office_movies['movies']
    @names_and_ids = {}
    box_office_movies['movies'].each_with_index do |movie, idx|
      @names_and_ids[box_office_movies['movies'][idx]['title']] = {imdb: "tt"+box_office_movies['movies'][idx]['alternate_ids']['imdb'],
        movie_poster: "http://img.omdbapi.com/?i=#{'tt'+box_office_movies['movies'][idx]['alternate_ids']['imdb']}&apikey=#{ENV['OMDB_KEY']}",
        mpaa:box_office_movies['movies'][idx]['mpaa_rating'],
        rating: box_office_movies['movies'][idx]['ratings']['critics_score'],
        synopsis:box_office_movies['movies'][idx]['synopsis'],
        release_date:box_office_movies['movies'][idx]['release_dates']['theater'],
        runtime: box_office_movies['movies'][idx]['runtime']
      }
    end

    ##Get Fandango IDs
    id_hash = {}
    nearby_theaters = Fandango.movies_near(94107)
    nearby_theaters.each do |theater|
      theater[:movies].each do |movie_title|
        if !(id_hash.has_key?(movie_title[:title]))
          id_hash["#{movie_title[:title]}"] = movie_title[:id]
        end
      end
    end
    ####
    @names_and_ids.each do |movie|
      if id_hash.has_key?(movie.first)
        movie.last[:fandango] = id_hash[movie.first]
      end
    end

    ##Conversation
    @receiver = conversation_interlocutor(@playdate)
    @messages = @playdate.messages
    @message = Message.new

  end

  def create
    params[:playdate][:initiator_id] = session[:profile_id]
    playdate = Playdate.new(playdate_params)

    if playdate.save
      redirect_to date_path(playdate)
    else
      redirect_to root_path
    end
  end

  private

  def playdate_params
    params.require(:playdate).permit(:initiator_id,:recipient_id)
  end

  def conversation_interlocutor(conversation)
    current_user == conversation.recipient.parent ? conversation.initiator : conversation.recipient
  end
end



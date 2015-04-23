class PlaydatesController < ApplicationController
  # require 'awesome_print'
  def index
  end

  def show
    @playdate = Playdate.find(params[:id])
    redirect_to user_path(current_user) unless current_user.my_child(@playdate)

    @upcoming_experiences = Experience.upcoming_experiences
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
    playdate = Playdate.find_or_initialize_by(playdate_params) #can only request date with someone once
    if playdate.save
      redirect_to date_path(playdate)
    else
      redirect_to root_path
    end

  end

  def update
    date = Playdate.find(params[:id])

    if params[:experience_id]
      experience = Experience.find(params[:experience_id])
      experience_data = {formattedExperienceDate: experience.experience_at_formatted}
      date.experience = experience
    else
      experience_data = {}
    end

    if params[:movie_id]
      movie = Movie.find(params[:movie_id]) if params[:movie_id]
      movie_data = { formattedMovieDate: movie.movie_at_formatted, movieDescriptionClipped: movie.description_clipped, movieRatingFormatted: movie.rating_formatted }
      date.movie = movie
    else
      movie_data = {}
    end

    date.recipient_confirmed = false
    date.initiator_confirmed = false

    if current_user.initiated_date?(date) && !(date.initiator_confirmed)
      delete_button = true
    elsif !(current_user.initiated_date?(date)) && !(date.recipient_confirmed)
      delete_button = true
    else
      delete_button = false
    end

    recipient = (current_user == date.recipient.parent ? true : false )

    if date.save!
      render json: { recipient: recipient, playdate: date, experience: experience, deleteButton: delete_button, experienceData: experience_data, movieData: movie_data }, status: :ok
    else
      render json: { errors: date.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def delete_event
    playdate = Playdate.find(params[:id])

    playdate.recipient_confirmed = false
    playdate.initiator_confirmed = false

    playdate.experience_id = nil

    playdate.save

    render json: { message: 'Successfully deleted.' }, status: :no_content
  end

  def accept_invitation
    date = Playdate.find(params[:id])
    if date.recipient.parent == current_user
      date.recipient_accepted = true
      date.save!
    end
    render json: { message: "Successfully accepted.", dateId: date.id }, status: :ok
  end

  def confirm_date
    date = Playdate.find(params[:id])
    if date.recipient.parent == current_user
      date.recipient_confirmed = true
      date.save!
    elsif date.initiator.parent == current_user
      date.initiator_confirmed = true
      date.save!
    else
      puts "Something is wrong"
    end

    recipient = (current_user == date.recipient.parent ? true : false )

    render json: { recipient: recipient }
  end

  def add_experience
    date = Playdate.find(params[:id])
    experience = Experience.find(params[:exp_id])
    if (current_user.initiated_date?(date)) && (date.experience_id != experience.id)
      date.recipient_confirmed = false
    elsif !(current_user.initiated_date?(date)) && (date.experience_id != experience.id)
      date.initiator_confirmed = false
    end
    date.experience_id = params[:exp_id]
    date.save!
  end

  def add_movie
  end

  private

  def playdate_params
    params.require(:playdate).permit(:initiator_id,:recipient_id)
  end

  def conversation_interlocutor(conversation)
    current_user == conversation.recipient.parent ? conversation.initiator : conversation.recipient
  end
end



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
    # id_hash = {}
    # nearby_theaters = Fandango.movies_near(94107)

    # (0..1).each do |theater_idx|
    #   nearby_theaters[theater_idx][:movies].each do |movie_title|
    #     if !(id_hash.has_key?(movie_title[:title]))
    #       id_hash["#{movie_title[:title]}"] = movie_title[:id]
    #     end
    #   end
    # end

    ####
    # @names_and_ids.each do |movie|
    #   if id_hash.has_key?(movie.first)
    #     movie.last[:fandango] = id_hash[movie.first]
    #   end
    # end

    @names_and_ids = {"Furious 7"=>{:imdb=>"tt2820852", :movie_poster=>"http://img.omdbapi.com/?i=tt2820852&apikey=e5b6d27", :mpaa=>"PG-13", :rating=>82, :synopsis=>"Continuing the global exploits in the unstoppable franchise built on speed, Vin Diesel, Paul Walker and Dwayne Johnson lead the returning cast of Fast & Furious 7. James Wan directs this chapter of the hugely successful series that also welcomes back favorites Michelle Rodriguez, Jordana Brewster, Tyrese Gibson, Chris \"Ludacris\" Bridges, Elsa Pataky and Lucas Black. They are joined by international action stars new to the franchise including Jason Statham, Djimon Hounsou, Tony Jaa, Ronda Rousey and Kurt Russell.", :release_date=>"2015-04-03", :runtime=>140, :fandango=>"172963"}, "Paul Blart: Mall Cop 2"=>{:imdb=>"tt3450650", :movie_poster=>"http://img.omdbapi.com/?i=tt3450650&apikey=e5b6d27", :mpaa=>"PG", :rating=>0, :synopsis=>"After six years of keeping our malls safe, Paul Blart has earned a well-deserved vacation. He heads to Vegas with his teenage daughter before she heads off to college. But safety never takes a holiday and when duty calls, Blart answers. (C) Sony", :release_date=>"2015-04-17", :runtime=>94, :fandango=>"179878"}, "Unfriended"=>{:imdb=>"tt3713166", :movie_poster=>"http://img.omdbapi.com/?i=tt3713166&apikey=e5b6d27", :mpaa=>"R", :rating=>64, :synopsis=>"Unfriended unfolds over a teenager's computer screen as she and her friends are stalked by an unseen figure who seeks vengeance for a shaming video that led a vicious bully to kill herself a year earlier.", :release_date=>"2015-04-17", :runtime=>82, :fandango=>"179657"}, "Home"=>{:imdb=>"tt2224026", :movie_poster=>"http://img.omdbapi.com/?i=tt2224026&apikey=e5b6d27", :mpaa=>"PG", :rating=>47, :synopsis=>"When Oh, a loveable misfit from another planet, lands on Earth and finds himself on the run from his own people, he forms an unlikely friendship with an adventurous girl named Tip who is on a quest of her own. Through a series of comic adventures with Tip, Oh comes to understand that being different and making mistakes is all part of being human. And while he changes her planet and she changes his world, they discover the true meaning of the word HOME. (c) Fox", :release_date=>"2015-03-26", :runtime=>93, :fandango=>"161124"}, "The Longest Ride"=>{:imdb=>"tt2726560", :movie_poster=>"http://img.omdbapi.com/?i=tt2726560&apikey=e5b6d27", :mpaa=>"PG-13", :rating=>29, :synopsis=>"Based on the bestselling novel by master storyteller Nicholas Sparks, THE LONGEST RIDE centers on the star-crossed love affair between Luke, a former champion bull rider looking to make a comeback, and Sophia, a college student who is about to embark upon her dream job in New York City's art world. As conflicting paths and ideals test their relationship, Sophia and Luke make an unexpected and feateful connection with Ira, whose memories of his own decades-long romance with his beloved wife deeply inspire the young couple. Spanning generations and two intertwining love stories, THE LONGEST RIDE explores the challenges and infinite rewards of enduring love. (C) Fox", :release_date=>"2015-04-10", :runtime=>128, :fandango=>"179361"}, "Get Hard"=>{:imdb=>"tt2561572", :movie_poster=>"http://img.omdbapi.com/?i=tt2561572&apikey=e5b6d27", :mpaa=>"R", :rating=>29, :synopsis=>"Will Ferrell and Kevin Hart headline this Warner Bros. comedy about a wrongfully convicted investment banker who prepares for prison life with the help of the man who washes his car. Etan Cohen directs, with Ian Roberts and Jay Martel handling screenwriting duties. ~ Jason Buchanan, Rovi", :release_date=>"2015-03-27", :runtime=>100, :fandango=>"179314"}, "Woman in Gold"=>{:imdb=>"tt2404425", :movie_poster=>"http://img.omdbapi.com/?i=tt2404425&apikey=e5b6d27", :mpaa=>"PG-13", :rating=>54, :synopsis=>"WOMAN IN GOLD is the remarkable true story of one woman's journey to reclaim her heritage and seek justice for what happened to her family. Sixty years after she fled Vienna during World War II, an elderly Jewish woman, Maria Altmann (Mirren), starts her journey to retrieve family possessions seized by the Nazis, among them Klimt's famous painting 'Portrait of Adele Bloch-Bauer I'. Together with her inexperienced but plucky young lawyer Randy Schoenberg (Reynolds), she embarks upon a major battle which takes them all the way to the heart of the Austrian establishment and the U.S. Supreme Court, and forces her to confront difficult truths about the past along the way. (C) TWC", :release_date=>"2015-04-01", :runtime=>110, :fandango=>"179452"}, "Monkey Kingdom"=>{:imdb=>"tt3660770", :movie_poster=>"http://img.omdbapi.com/?i=tt3660770&apikey=e5b6d27", :mpaa=>"G", :rating=>93, :synopsis=>"Mark Linfield's nature documentary Monkey Kingdom follows the struggles of a young monkey mother to care for and raise her new baby in the wilds of Southern Asia.", :release_date=>"2015-04-17", :runtime=>85, :fandango=>"178809"}, "Insurgent"=>{:imdb=>"tt2908446", :movie_poster=>"http://img.omdbapi.com/?i=tt2908446&apikey=e5b6d27", :mpaa=>"PG-13", :rating=>31, :synopsis=>"THE DIVERGENT SERIES: INSURGENT raises the stakes for Tris as she searches for allies and answers in the ruins of a futuristic Chicago. Tris (Woodley) and Four (James) are now fugitives on the run, hunted by Jeanine (Winslet), the leader of the power-hungry Erudite elite. Racing against time, they must find out what Tris's family sacrificed their lives to protect, and why the Erudite leaders will do anything to stop them. Haunted by her past choices but desperate to protect the ones she loves, Tris, with Four at her side, faces one impossible challenge after another as they unlock the truth about the past and ultimately the future of their world. (C) Lionsgate", :release_date=>"2015-03-20", :runtime=>119}, "Cinderella"=>{:imdb=>"tt1661199", :movie_poster=>"http://img.omdbapi.com/?i=tt1661199&apikey=e5b6d27", :mpaa=>"PG", :rating=>85, :synopsis=>"Cate Blanchett stars in this new vision of the Cinderella tale from director Kenneth Branagh and the screenwriting team of Chris Weitz and Aline Brosh McKenna for Disney Pictures. ~ Jeremy Wheeler, Rovi", :release_date=>"2015-03-13", :runtime=>105}}

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



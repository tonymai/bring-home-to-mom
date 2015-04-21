class ProfilesController < ApplicationController
  def index
  end

  def new
    @parent = Parent.find(params[:user_id])
    @child = Child.new

    # Refactor for more efficient sorting
    interests = Interest.all.sort_by { |interest| interest.children.count }.reverse
    @top_interests = interests[0..49].sort_by { |interest| interest.name }
    @interest = Interest.new

    @values = Value.all
  end

  def show
    @child = Child.find(params[:id])

    if @child
      render json: { profile: @child, interests: @child.interests, values: @child.values, age: @child.age }, status: :ok
    else
      render json: { error: 'Profile does not exist' }, status: :not_found
    end
  end

  def create
    @parent = Parent.find(params[:user_id])
    @child = @parent.children.new(profile_params)

    # upload profile image if provided
    Child::PF_IMAGE_INDEX.each do |pf_image_key|
      @child.save_profile_image(params[:child][pf_image_key], pf_image_key) if params[:child][pf_image_key] != ""
    end

    if @child.save
      session[:profile_id] = @child.id
      render json: @child, status: :created
    else
      render json: { errors: @child.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    #Only written for adding interests right now; when we create full edit page, this will need conditional logic to handle all cases
    @parent = Parent.find(params[:user_id])
    @child = Child.find(params[:id])
    interests = params[:interests]
    values = params[:values]
    if interests
      interests.each do |interest_id|
        @child.children_interests.find_or_initialize_by(interest_id: interest_id)
      end
    end
    if values
      values.each do |value_id|
        @child.children_values.find_or_initialize_by(value_id: value_id)
      end
    end

    if @child.save
      render json: {}, status: :ok
    else
      render json: { errors: @child.errors.full_messages }, status: :unprocessable_entity
    end

  end

  private

  def profile_params
    params.require(:child).permit(
      :first_name,
      :last_name,
      :city,
      :state,
      :phone,
      :gender,
      :sexual_preference,
      :religion,
      :birthdate,
      :bio,
      :smoke,
      :linkedin_url,
      :facebook_url,
      :embarrassing_moment)
  end
end

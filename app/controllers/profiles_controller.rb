class ProfilesController < ApplicationController
  def index
  end

  def new
    @parent = Parent.find(params[:user_id])
    @child = Child.new

    @interests = Interest.all.sort_by { |interest| interest.children.count }.reverse
    @interest = Interest.new
  end

  def create
    @parent = Parent.find(params[:user_id])
    @child = @parent.children.new(profile_params)

    # upload profile image if provided
    Child::PF_IMAGE_INDEX.each do |pf_image_key|
      @child.save_profile_image(params[:child][pf_image_key], pf_image_key) if params[:child][pf_image_key] != ""
    end

    if @child.save
      render json: @child, status: :created
    else
      render json: { errors: @child.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    #Only written for adding interests right now; when we create full edit page, this will need conditional logic to handle all cases
    @parent = Parent.find(params[:user_id])
    # byebug
    # @child =

    redirect '/'
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

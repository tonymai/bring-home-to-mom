class ProfilesController < ApplicationController
  def index
  end

  def new
    @parent = Parent.find(params[:user_id])
    @child = Child.new
  end

  def create
    @parent = Parent.find(params[:user_id])
    @child = @parent.children.new(profile_params)

    # upload profile image if provided
    Child::PF_IMAGE_INDEX.each do |pf_image_key|
      @child.save_profile_image(params[:child][pf_image_key], pf_image_key) if params[:child][pf_image_key]
    end

    if @child.save
      redirect_to user_path(@parent)
    else
      render :new
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
      :facebook_url)
  end
end

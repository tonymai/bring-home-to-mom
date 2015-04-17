class ProfilesController < ApplicationController
  def index
  end

  def new
    @parent = Parent.find(params[:user_id])
    @child = Child.new
  end

  def create
    # render json: params
    @parent = Parent.find(params[:user_id])
    @child = @parent.children.new(profile_params)
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
      :facebook_url,
      :pf_image_1,
      :pf_image_2,
      :pf_image_3,
      :pf_image_4,
      :pf_image_5)
  end
end

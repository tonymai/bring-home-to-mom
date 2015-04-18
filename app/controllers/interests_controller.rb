class InterestsController < ApplicationController

  def index
    # @child = Child.find(params[:child_id])
  end

  def create
    @child = Child.find(params[:child_id])
    @interest = Interest.find_or_initialize_by(interest_params)

    if @interest.save
      @child.interests << @interest
    else
      render json: { errors: @interest.errors.full_messages }, status: :unprocessable_entity
    end

    if @child.save
      render json: { interest: @interest, status: :ok }
    else
      render json: { errors: @child.errors.full_messages }, status: :unprocessable_entity
    end

  end

  private

  def interest_params
    params.require(:interest).permit(:name)
  end
end

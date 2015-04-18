class InterestsController < ApplicationController

  def index
    # @child = Child.find(params[:child_id])
  end

  def create
    @child = Child.find(params[:child_id])
    @interest = Interest.find_by_name(params[:interest][:name])

    if @interest
      @child.interests << @interest
      render json: { interest: @interest, status: :ok }
    else
      @interest = Interest.new(interest_params)

      if @interest.save
        @child.interests << @interest
        render json: { interest: @interest, status: :created }
      else
        render json: { errors: @interest.errors.full_messages, status: :unprocessable_entity }
      end
    end

  end

  private

  def interest_params
    params.require(:interest).permit(:name)
  end
end

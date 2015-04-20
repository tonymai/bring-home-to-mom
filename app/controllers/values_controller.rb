class ValuesController < ApplicationController

  def create
    @child = Child.find(params[:child_id])
    params[:value][:name] = params[:value][:name].downcase.titleize
    @value = Value.find_or_initialize_by(value_params)

    if @value.save
      @child.values << @value
      render json: { value: @value, status: :ok }
    else
      render json: { errors: @value.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def value_params
    params.require(:value).permit(:name)
  end
end

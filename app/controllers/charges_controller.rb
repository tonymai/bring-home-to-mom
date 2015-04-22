class ChargesController < ApplicationController

	def new

	end

	def create
		date = Playdate.find(params[:date_id])
		@amount = date.total_cost_per_person # amount in cents

		customer = Stripe::Customer.create(
			email:  params[:stripeEmail],
			card:   params[:stripeToken]
		)

		charge = Stripe::Charge.create(
		  customer:    customer.id,
		  amount:      @amount,
		  description: date.id,
		  currency:    'usd'
		)

		if current_user == date.initiator
			date.initiator_paid = true
		elsif current_user == date.recipient 
			date.recipient_paid = true
		end

		date.save
		redirect_to "/users/#{current_user.id}"

		rescue Stripe::CardError, Stripe::InvalidRequestError => e
		  flash[:error] = e.message
		  redirect_to date_path(date)
	end

end

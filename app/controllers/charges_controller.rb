class ChargesController < ApplicationController

	def new

	end

	def create
		@amount = 5000 # amount in cents

		customer = Stripe::Customer.create(
			email:  params[:stripeEmail],
			card:   params[:stripeToken]
		)

		charge = Stripe::Charge.create(
		  customer:    customer.id,
		  amount:      @amount,
		  description: 'Rails Stripe customer',
		  currency:    'usd'
		)

		current_user
		
		redirect_to "/users/#{current_user.id}"

		# render json: { customer: customer, charge: charge, user_id: current_user.id }

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to charges_path
	end

end

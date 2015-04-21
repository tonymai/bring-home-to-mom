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

		render json: { customer: customer, charge: charge }

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to charges_path
	end

end

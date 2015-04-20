class UsersController < ApplicationController
	def messages
		@users = Parent.all
	end
end

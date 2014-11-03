class UsersController < ApplicationController
	def index
  	if user_signed_in?
  		@items = Item.where(user_id: current_user.id)
  	end
  end
end

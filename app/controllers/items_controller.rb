class ItemsController < ApplicationController
	def index
	end

	def show
	end

	def new
		if user_signed_in?
			@user = current_user
		else
			render plain: "Please sign in, before trying to add a Todo Item."
		end
	end

	def create
		@user = User.find(params[:user_id])
		@item = @user.items.create(item_params)
		render plain: "Created the todo item."
		# redirect_to user_path(@user)
	end

	private
	def item_params
		params.require(:item).permit(:title, :content)
	end
end

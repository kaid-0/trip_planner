class UserController < ApplicationController

	def index
	end

	def new
		@user = User.new
	end

	def signup
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Account Created Successfully!"
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end


	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confimation, :first_name, :last_name, :phone)
	end
end
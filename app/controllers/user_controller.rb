class UserController < ApplicationController

	def index
		if session[:user_id]
			@user = User.find_by(id: session[:user_id])
		end
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

	def signout
		session[:user_id] = nil
		flash[:notice] = "Logged Out Successfully!"
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confimation, :first_name, :last_name, :phone)
	end
end
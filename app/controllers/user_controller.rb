class UserController < ApplicationController

	def index
		if session[:user_id]
			@user = User.find_by(id: session[:user_id])
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Account Created Successfully!"
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show
		if session[:user_id] == 1
			@users = User.all
		else
			flash[:notice] = "Only Admin can view the page"
			redirect_to root_path
		end
	end

	def show_user
		@user = User.find(params[:id])
	end

	def update_user
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "Account Updated Successfully!"
			redirect_to '/users'
		else
			render :show_user, status: :unprocessable_entity
		end
	end

	def show_user_trips
		@user = User.find(params[:id])
		@trips = @user.trips
	end

	def signout
		session[:user_id] = nil
		flash[:notice] = "Logged Out Successfully!"
		redirect_to root_path
	end

	def signin_new
	end


	def signin_create
		user = User.find_by(email: params[:email])
		
		if user.present? && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path, notice: "Logged in successfully!"
		else
			flash[:alert] = "Invalid Email or Password"
			render :signin_new, status: :unprocessable_entity
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confimation, :first_name, :last_name, :phone)
	end
end
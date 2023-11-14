class TripController < ApplicationController

	def new
	end

	def create
		@trip = Trip.new(trip_params)
		if @trip.save
			flash[:notice] = "Trip Created Successfully!"
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end
	
	def edit
		@trip = Trip.find(params[:id])
	end

	def update
		@trip = Trip.find(params[:id])
		
		if @trip.update(trip_params)
			flash[:notice] = "Trip Updated Successfully!"
			redirect_to root_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	private

	def trip_params
		params[:trip] ? params.require(:trip).permit(:city, :from_date, :end_date, :head_count) : params.permit(:user_id, :city, :from_date, :end_date, :head_count)
	end
end
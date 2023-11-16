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

	def destroy
		@trip = Trip.find(params[:id])
		@trip.destroy
		redirect_to root_path
	end

	def suggest_trip()

		input = "Dubai"
		access_token = "pk.eyJ1Ijoia2FpZDAiLCJhIjoiY2xvcGpybHlqMDk1bzJxbHdlZjM5Y3pybyJ9.yhEcZ2WQWcaukkpc_K9bYg"
		session_token = "0abd9ab0-a686-4391-88bd-686957b03479"
		@suggest_url = "https://api.mapbox.com/search/searchbox/v1/suggest?"

		input_query = {
			"access_token" => access_token,
			"session_token" => session_token,
			"q" => input,
			"limit" => "1",
			"types" => "city,region,street,district"
		}
		@input_response = HTTParty.get(@suggest_url, :query => input_query, timeout: 180)

		@input_response["suggestions"].each do |res|
			@mapbox_id = res["mapbox_id"]
		end
		
		retrieve_url = "https://api.mapbox.com/search/searchbox/v1/retrieve/#{@mapbox_id}?"

		query02 = {
			"access_token" => access_token,
			"session_token" => session_token
		}
		@response02 = HTTParty.get(retrieve_url, :query => query02, timeout: 180)

		@response02["features"].each do |res|
			@loc_name = res["properties"]["place_formatted"]
			@latit = res["properties"]["coordinates"]["latitude"]
			@longit = res["properties"]["coordinates"]["longitude"]
		end

		@hotel_response = trip_output('hotel', access_token, session_token)

		@restaurant_response = trip_output('restaurant', access_token, session_token)

		@tourist_response = trip_output('tourist_attraction', access_token, session_token)
	end

	private

	def trip_params
		params.has_key?(:trip) ? params.require(:trip).permit(:city, :from_date, :end_date, :head_count) : params.permit(:user_id, :city, :from_date, :end_date, :head_count)
	end

	def trip_output(category = '', access, session)
		query = {
			"q" => "Atlantis",
			"access_token" => access,
			"session_token" => session,
			"limit" => "5",
			"poi_category" => category,
			"proximity" => "#{@longit},#{@latit}"
		}

		return HTTParty.get(@suggest_url, :query => query, timeout: 180)
	end
end
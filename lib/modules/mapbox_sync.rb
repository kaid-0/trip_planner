# class MapBoxAPI
# 	include HTTParty

# 	def suggest_data()
# 		begin
# 		search_text = "dubai"
# 		session_token = "0f473eae-647c-4e41-88bd-1bcf0d9036c6"
# 		access_token = "pk.eyJ1Ijoia2FpZDAiLCJhIjoiY2xvcGpybHlqMDk1bzJxbHdlZjM5Y3pybyJ9.yhEcZ2WQWcaukkpc_K9bYg"
# 		url = "https://api.mapbox.com/search/searchbox/v1/suggest?"
# 		query = { 
# 			"q" => "#{search_text}"
# 			"session_token" => "#{session_token}",
# 			"access_token" => "#{access_token}"
# 		}

# 		response = HTTParty.get(url, :query => query, timeout: 180)


# 		# HTTParty.get("https://postman-echo.com/get")

# 		data = response.parsed_response
# 		data["suggestions"].each do |res|  
# 	    # This should only save when the user clicks on the suggestions
# 	    puts res
# 	    # mapbox_id = res["mapbox_id"]
# 		end
	  
# 	  #   rescue => e
# 	  #   	puts e.inspect
# 	  #   end



# 		# access_token = "pk.eyJ1Ijoia2FpZDAiLCJhIjoiY2xvcGpybHlqMDk1bzJxbHdlZjM5Y3pybyJ9.yhEcZ2WQWcaukkpc_K9bYg"
# 		# session_token = "0c777516-2022-47b1-88bc-d906d910ee81"
# 		# input = "Dubai"
# 		# url = "https://api.mapbox.com/search/searchbox/v1/suggest?"

# 		# query = {
# 		# 	"access_token" => access_token,
# 		# 	"session_token" => session_token
# 		# 	"q" => input
# 		# }

# 		# puts "****************"
# 		# puts url
# 		# puts query
# 		# response01 = HTTParty.get(url, :query => query, timeout: 180)
# 		# puts response01
# 		# puts "****************"
# 		# data01 = response01.parsed_response
# 		# data01.each do |d|
# 		# 	puts d
# 		# end	
# 		# mapbox_id = data01["mapbox_id"]

# 		# latit = ''
# 		# longit = ''

# 		# "#{url}q=Hotel&language=en&limit=5&proximity=#{longit},#{latit}&session_token=0cd8ba5b-79d6-46f1-88bc-d0ad83b091b4&access_token=#{access_token}"
# 		# "#{url}q=Hotel&language=en&limit=5&proximity=#{longit},#{latit}&session_token=0cd8ba5b-79d6-46f1-88bc-d0ad83b091b4&access_token=#{access_token}"
# 		# "#{url}q=Hotel&language=en&limit=5&proximity=#{longit},#{latit}&session_token=0cd8ba5b-79d6-46f1-88bc-d0ad83b091b4&access_token=#{access_token}"

		
# 	 	# response = HTTParty.get(url, :query => query, timeout: 180)
# 	  	# if response.code != 200
# 	    # 	response = HTTParty.get(url.gsub('&limit=250','').gsub('limit=250',''), :headers => header, timeout: 180)
# 	  	# end
	  
# 	 	# return response
# 	end
# end
module MapBoxAPI
	include HTTParty

	def suggest_data()

access_token = "pk.eyJ1Ijoia2FpZDAiLCJhIjoiY2xvcGpybHlqMDk1bzJxbHdlZjM5Y3pybyJ9.yhEcZ2WQWcaukkpc_K9bYg"
session_token = "0f473eae-647c-4e41-88bd-1bcf0d9036c6"
input = "Dubai"
url = "https://api.mapbox.com/search/searchbox/v1/suggest?"

query = {
	"access_token" => access_token,
	"session_token" => session_token,
	"q" => input,
	"limit" => "1"
}

		puts "****************"
		response01 = HTTParty.get(url, :query => query, timeout: 180)
		puts response01["suggestions"]
		puts "****************"

	end
end
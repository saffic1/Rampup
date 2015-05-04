require 'HTTParty'

class FindLibrary
	def initialize
		choose_area
	end

	def choose_area
		puts "What area in New York do you live? I will find the closest library for you."
		area_choice = gets.chomp
		encoded_response = URI.encode(area_choice)
		response = HTTParty.get(
			"https://data.cityofnewyork.us/resource/kh3d-xhq7.json?name=#{encoded_response}")

		parsed_response = JSON.parse(response.body)
		result = parsed_response.first

		puts "The #{result["name"]} library is located at #{result["location_1"]} . It is open Monday from #{result["mn"]} , Tuesday from #{result["tu"]} , Wednesday from #{result["we"]} , Thursday from #{result["th"]} , and Friday from #{result["fr"]} . You can also call them at #{result["phone"]} ."

	end
end

FindLibrary.new
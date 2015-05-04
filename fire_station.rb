require 'httparty'

class FireStation
   def initialize 
   	find_station
   end
   
   def find_station
   	puts "Which fire station are you looking for?"
   	fire_station = gets.chomp
   	encoded_response = URI.encode(fire_station)
   	response = HTTParty.get(
       	"https://data.cityofnewyork.us/resource/hc8x-tcnd.json?facilityname=#{encoded_response}")
   
   parsed_response = JSON.parse(response.body)
   result = parsed_response.first 

   puts "THe location of #{result["facilityname"]} is at #{result["facilityaddress"]} in #{result["borough"]}"

   end
end

FireStation.new
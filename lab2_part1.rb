bottles_on_wall = 99
bottles_left = 98

until bottles_on_wall == 0
	puts "#{bottles_on_wall} bottle(s) of beer on the wall, #{bottles_on_wall} bottle(s) of beer. 
	Take one down, pass it around, #{bottles_left} bottle(s) of beer on the wall."

	bottles_on_wall -= 1
	bottles_left -= 1

end

puts "No more bottles of beer on the wall, no more bottles of beer. 
Go to the store and buy some more, 99 bottles of beer on the wall."
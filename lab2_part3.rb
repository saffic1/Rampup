question = gets.chomp

goodbye = 0

while goodbye != 2
	
	if question == 'BYE'
		goodbye += 1
	  else
		goodbye = 0
	end

	if question != question.upcase
		puts 'HUH?!, SPEAK UP SONNY!'

	  else 
		puts 'NO, NOT SINCE ' + rand(1930..1980).to_s+'!'
	end
	question = gets.chomp
end
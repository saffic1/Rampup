x = 1

while x > 0

year_between = rand(1930..1980)

answer = "BYE"


question = gets.chomp

	if (question == question.upcase) && (question == answer)

	  break 

	  elsif (question == question.upcase) && (question != answer)
		puts "NO, NOT SINCE #{year_between}!"

	  else (question != question.upcase) && (question != answer)
		puts "HUH?!, SPEAK UP SONNY!"

	end

end

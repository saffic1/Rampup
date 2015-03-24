magic_num = rand(100)

guess_num = 10

while guess_num >0

puts "Guess a number: "

number = gets.chomp.to_i


if number == magic_num
	puts "You guessed correctly. Congrats!"

	break


elsif number < magic_num
	puts "Your guess is too low. Try again"

else 

	puts "Your guess is too high. Try again"

end

guess_num -= 1

puts "You have #{guess_num} guesses left."

end 

puts "THe number was #{magic_num}."
puts "What is your name?"
name = gets.chomp

puts "What is your age?"
age = gets.to_i

def year_born(age)

	(age - 2015).abs
end


puts name + " was born in " 
puts year_born(age).to_i

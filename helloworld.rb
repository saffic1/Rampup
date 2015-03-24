

def say_hello(first_name)
	"Hello "  + first_name 
end

def shout_it(first_name)
	say_hello(first_name).upcase
end

first_name = "Richard"

puts shout_it(first_name)



puts "What is your name?"
name = gets.chomp
puts name + " is your name"
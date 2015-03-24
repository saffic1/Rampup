puts "What is the temperature outside (in celcius)?"

c_temp = gets.to_f

def c_to_f(c_temp)

	c_temp * 9.0 / 5.0 + 32
end

puts "The farhenheit temperature outside is " 

puts c_to_f(c_temp) 

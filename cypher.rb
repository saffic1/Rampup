@cipher = { "a" => "0", 
		   "b" => "1", 
		   "c" => "2",  
		   "d" => "3",
		   "e" => "4",
		   "f" => "5",
		   "g" => "6",
		   "h" => "7",
		   "i" => "8",
		   "j" => "9",
		   "k" => "`",
		   "l" => "~",
		   "m" => "!",
		   "n" => "@",
		   "o" => "#",
		   "p" => "$",
		   "q" => "%",
		   "r" => "^",
		   "s" => "&",
		   "t" => "*",
		   "u" => "(",
		   "v" => ")",
		   "w" => "_",
		   "x" => "-",
		   "y" => "+",
		   "z" => "=" }


def encrypt
  puts "Please encrypt:"
  answer = gets.chomp
  
  word_list = answer.split(//)
  
  encrypt = word_list.map do |letter|
    @cipher[letter]
  end

  puts "Encrypted:   #{encrypt.join("")}"
end

def decrypt
  puts "Please decrypt:"
  answer = gets.chomp
  
  word_list = answer.split(//)
  
  decrypt = word_list.map do |letter|
    @cipher.invert[letter]
  end
  puts "Decrypted:   #{decrypt.join("")}"
end

encrypt
decrypt
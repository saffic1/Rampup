class Dealer

	attr_accessor :hand


	def initialize
		self.hand = []
	end

	def total_points
		self.hand.inject(:+)
	end

end

class Player
	
	attr_accessor :name, :hand

	def initialize
		puts "What is your name?"
		name = gets.chomp
		self.name = name
		self.hand = []
	end

	def total_points
		self.hand.inject(:+)
	end

end

class Blackjack
	attr_accessor :player, :dealer

	def initialize 
		self.player = Player.new
		self.dealer = Dealer.new
		play_game
	end

	def deck_of_cards
		@deck_of_cards = [[1,2,3,4,5,6,7,8,9,] * 4 , [10] * 16].flatten.shuffle
	end

	def see_cards
		puts "Hi, #{self.player.name}, You have #{self.player.total_points}."
		puts "The top card for the dealer is #{self.dealer.hand.first}."
	end

	def play_game
		deal_cards
		see_cards
	end	

	def deal_cards
		2.times do
			self.player.hand << self.deck_of_cards.pop
			self.dealer.hand << self.deck_of_cards.pop
			
		end
	
	end	


end


game = Blackjack.new


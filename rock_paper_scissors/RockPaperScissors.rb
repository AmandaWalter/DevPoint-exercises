#Rock Paper Scissors#
puts "============================"
puts "Rock,Paper,Scissors...Throw!"
puts "============================"
play_game = "Y"
$wins = 0
$losses = 0
def game
	rps_array = ["rock","paper","scissors"]
	player_1 = ""
	player_2 = (rps_array.sample).to_s
	until rps_array.include?(player_1)
		puts "Make your selection: rock, paper or scissors"
		player_1 = gets.chomp.downcase
	end
	puts player_1 +" vs "+ player_2
 	if player_1 == player_2
 		puts "Draw"
 	elsif (player_1 == "rock" and player_2 == "scissors") ||
 				(player_1 == "paper" and player_2 == "rock") || 
 				(player_1 == "scissors" and player_2 == "paper")
 		puts "You win!"
 		$wins+=1
	else
 		puts "You lose!"
 		$losses+=1
 	end
end
while play_game == "Y"
	game

	puts "Wins: #{$wins} Losses:#{$losses}"
	puts "Would you like to play again? Y/N"
	play_game = gets.chomp.upcase
		if play_game == "N"
			puts "See you later!"
		end
end
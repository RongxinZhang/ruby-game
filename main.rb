require './Player'  
require './Game'  

player1 = Player.new("Alice");
player2 = Player.new("Bob");

game = Game.new([player1, player2])

game.start

while game.continue?
  puts "----- NEW TURN -----"
  # puts game.current_player.name
  # puts game.current_player.life

  puts "#{game.current_player.name}: #{game.current_question[:question]}"
  # puts game.current_questi`on[:answer]

  answer = gets.chomp
  puts game.submit_answer(answer)

  puts game.players_status

  game.next_round
end 

puts "End of Game, #{game.current_player.name} lost"
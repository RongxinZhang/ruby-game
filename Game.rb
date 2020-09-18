# Player 1: What does 5 plus 3 equal?
# > 9
# Player 1: Seriously? No!
# P1: 2/3 vs P2: 3/3

# ----- NEW TURN -----
# Player 2: What does 2 plus 6 equal?
# > 8
# Player 2: YES! You are correct.
# P1: 2/3 vs P2: 3/3

# ----- NEW TURN -----
# ... some time later ...

# Player 1 wins with a score of 1/3
# ----- GAME OVER -----
# Good bye!


# 3. Game
# State: array of players, questions, current_turn, start-end state, user input
# Behavior: isgame still on?, choose a question, hand user input



class Game

  attr_accessor :players, 
                :current_question, 
                :current_player, 
                :rounds
  attr_reader :winner

  MAX_NUM = 100
  
  def initialize(players)
    @players = players
    @rounds = 0
  end

  def question_generator()
    num1 = rand(MAX_NUM)
    num2 = rand(MAX_NUM)
    
    {
      question: "What does #{num1} plus #{num2}",
      answer: num1 + num2
    }
  end

  def start()
    # if rounds != nil
    @current_player = @players[@rounds]
    @current_question = question_generator
  end

  def submit_answer(answer)
    if answer.to_i != @current_question[:answer]
      @current_player.life -= 1
      return "Seriously? No!"
    end
    "YES! You are correct."
  end

  def next_round()
    @rounds += 1

    @current_player = @players[@rounds % @players.length]
    @current_question = question_generator
  end

  def continue?()
    if @current_player.life <= 0
      return false
    end
    true
  end

  def players_status()
    p1 = @players[0]
    p2 = @players[1]
    "#{p1.name}: #{p1.life}/3 vs #{p2.name}: #{p2.life}/3"
  end

end




=begin

Nouns:
1. Player
State: name, life, turn
Behavior: answer

=end

class Player

  attr_accessor :name, :life, :turn

  def initialize(name)
    @name = name
    @life = 3
    @turn = false
  end

end

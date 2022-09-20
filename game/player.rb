class Player
  attr_accessor :score, :lives
  attr_reader :player_name
  def initialize (name)
    @player_name = name
    @lives = 3
    @score = 0
  end
  def change_life
    self.lives -= 1
  end

  def change_score
    self.score += 1
  end

end

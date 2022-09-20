class Game 
  attr_accessor :turn_player, :winner
  attr_reader :player1, :player2
  def initialize (player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @turn_player = @player1
    @winner = ""
  end

  def questions 
    [
      [1, "+", 2],
      [1, "-", 4],
      [1, "*", 5],
      [9, "/", 3],
      [1, "+", 62],
      [1, "%", 7],
      [1, "+", 8],
      [1, "-", 9],
      [1, "*", 0],
      [24, "/", 24]
    ]
  end

  def start
    puts "Current Player is #{turn_player.player_name}! Make it Count!"
    question_number = rand(0.. (questions.length - 1))
    question = questions[question_number].join(" ")
    puts "What is #{question}?"


    answer = gets.chomp.to_i
    expected = eval(question)
    if (answer == expected)
      puts "Correct!"
      turn_player.change_score
    else
      puts "Incorrect!"
      turn_player.change_life
    end
    current_score
    current_life
    
    if turn_player.lives > 0
      change_player
      puts start
    else
      puts "GAMEOVER"
      chooser_winner
    end
  end

  def change_player
    self.turn_player = turn_player == self.player1 ? self.player2 : self.player1
  end

  def chooser_winner
    if player1.score > player2.score
      winner = player1.player_name
    else winner = player2.player_name
    end
    puts "The winner is #{winner}!"
  end

  def current_score
    puts "#{turn_player.player_name}'s current score is #{turn_player.score}!"
  end
  def current_life
    puts "#{turn_player.player_name}'s current life is #{turn_player.lives}!"
  end

  def turn 
    puts "#{turn_player.player_name}'s Turn:"
    question
  end
end

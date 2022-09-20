require "./game"
require "./player"


player1 = Player.new("Sarah")
player2 = Player.new("Bob")
game = Game.new("Bob", "Sarah")
game.start
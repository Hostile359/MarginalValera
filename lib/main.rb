require_relative 'game_process'

class Main
  def self.main
    game = GameProcess.new
    game.do_action
  end
end

Main.main

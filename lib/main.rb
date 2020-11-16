require_relative 'game_process'
require_relative 'viewer'
require_relative 'reader'

class Main
  def initialize
    @game = GameProcess.new
    @viewer = Viewer.new
    @valera = Valera.new
    @reader = Reader.new
  end

  def start
    loop do
      @viewer.print_stats(@valera)
      @viewer.print_actions
      @reader.read_action(@game)
      @valera = @game.do_action
      if @valera == false
        puts('Валера умер! Конец игры')
        exit
      end
    end
  end
end

main = Main.new
main.start

require_relative 'game_process'

class Reader
  def read_action(game)
    loop do
      game.action_item = gets.chomp.to_i
      return unless (game.action_item < 1) || (game.action_item > 10)

      puts('Введите значение в диапозоне от 1 до 10')
    end
  end
end

require_relative 'valera'
require_relative 'actions'
require_relative 'saver'

class GameProcess
  attr_accessor :action_item, :valera, :actions

  @actions = {
    1 => ->(stats) { Actions.work(stats) },
    2 => ->(stats) { Actions.nature(stats) },
    3 => ->(stats) { Actions.relax_at_home(stats) },
    4 => ->(stats) { Actions.relax_in_bar(stats) },
    5 => ->(stats) { Actions.drink_with_marginals(stats) },
    6 => ->(stats) { Actions.sing_in_metro(stats) },
    7 => ->(stats) { Actions.go_to_sleep(stats) },
    8 => ->(stats) { Saver.saver(stats, 8) },
    9 => ->(stats) { Saver.saver(stats, 9) },
    10 => ->(_stats) { exit }
  }

  def initialize
    @valera = Valera.new
  end

  class << self
    attr_reader :actions
  end

  def check_action(stats)
    if @action_item == 1
      return (@valera.stats['mana'] >= 50) || (@valera.stats['tire'] >= 10) || (@valera.check_stats(stats) == false)
    end

    @valera.check_stats(stats) == false
  end

  def do_action
    stats = GameProcess.actions[@action_item].call(@valera.stats.clone)
    puts("\nНедопустимое действие! Попробуйте снова") if check_action(stats)
    return false if @valera.stats['health'] <= 0

    valera
  end
end

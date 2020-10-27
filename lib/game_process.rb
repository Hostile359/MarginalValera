require_relative 'valera'
require_relative 'actions'

class GameProcess
  attr_accessor :action_item, :valera, :actions

  @actions = {
    '1' => ->(stats) { Actions.work(stats) },
    '2' => ->(stats) { Actions.nature(stats) },
    '3' => ->(stats) { Actions.relax_at_home(stats) },
    '4' => ->(stats) { Actions.relax_in_bar(stats) },
    '5' => ->(stats) { Actions.drink_with_marginals(stats) },
    '6' => ->(stats) { Actions.sing_in_metro(stats) },
    '7' => ->(stats) { Actions.go_to_sleep(stats) },
    '9' => ->(_stats) { exit }
  }

  def initialize
    @valera = Valera.new
  end

  class << self
    attr_reader :actions
  end

  def print_actions
    puts('1. Пойти на работу (Можно только если алкоголь < 50, а усталость < 10)')
    puts('2. Созерцать природу')
    puts('3. Пить вино и смотреть сериал')
    puts('4. Сходить в бар')
    puts('5. Выпить с маргинальными личностями')
    puts('6. Петь в метро')
    puts('7. Спать')
    puts('8. Сохранить игру')
    puts('9. Выйти')
  end

  def read_action
    @action_item = gets.chomp
  end

  def check_action(stats)
    if @action_item == 1
      return (@valera.stats['mana'] >= 50) || (@valera.stats['tire'] >= 10) || (@valera.check_stats(stats) == false)
    end

    @valera.check_stats(stats) == false
  end

  def do_action
    loop do
      @valera.print_stats
      print_actions
      read_action
      stats = GameProcess.actions[@action_item].call(@valera.stats.clone)
      system('clear')
      puts("\nНедопустимое действие! Попробуйте снова") if check_action(stats)
      if @valera.stats['health'] <= 0
        puts('Валера умер! Конец игры')
        exit
      end
    end
  end
end

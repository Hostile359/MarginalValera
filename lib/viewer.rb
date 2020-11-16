require_relative 'valera'

class Viewer
  def print_actions
    puts("\n1. Пойти на работу (Можно только если алкоголь < 50, а усталость < 10)")
    puts('2. Созерцать природу')
    puts('3. Пить вино и смотреть сериал')
    puts('4. Сходить в бар')
    puts('5. Выпить с маргинальными личностями')
    puts('6. Петь в метро')
    puts('7. Спать')
    puts('8. Сохранить игру')
    puts('9. Загрузить игру')
    puts('10. Выйти')
  end

  def print_stats(valera)
    system('clear')
    puts("\nПараметры Валеры:")
    puts("Здоровье: #{valera.stats['health']}")
    puts("Алкоголь: #{valera.stats['mana']}")
    puts("Веселье: #{valera.stats['fun']}")
    puts("Усталость: #{valera.stats['tire']}")
    puts("Деньги: #{valera.stats['money']}\n\n")
  end
end

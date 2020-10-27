class Valera
  attr_accessor :stats

  def initialize(health = 100, mana = 0, fun = 0, money = 0, tire = 0)
    @stats = {
      'health' => health,
      'mana' => mana,
      'fun' => fun,
      'tire' => tire,
      'money' => money
    }
  end

  def check_stats(stats)
    if check_health(stats['health']) && check_mana(stats['mana']) \
       && check_fun(stats['fun']) && check_tire(stats['tire']) \
       && check_money(stats['money'])
      @stats = stats
      return true
    end
    false
  end

  def check_health(health)
    health <= 100 && health >= 0
  end

  def check_mana(mana)
    mana <= 100 && mana >= 0
  end

  def check_fun(fun)
    fun >= -10 && fun <= 10
  end

  def check_tire(tire)
    tire <= 100 && tire >= 0
  end

  def check_money(money)
    money >= 0
  end
end

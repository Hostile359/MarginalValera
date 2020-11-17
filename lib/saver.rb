require 'json'

class Saver
  def self.read_stats(filename)
    file = File.read(filename)
    JSON.parse(file)
  end

  def self.save_stats(stats, filename)
    file = File.open(filename, 'w')
    file.write(JSON.dump(stats))
    file.close
  end

  def self.saver(stats, choice, filename = nil)
    puts('Введите имя пользователя')
    filename = "./resources/#{gets.strip}.json" if filename.nil?
    puts filename
    if choice == 9
      read_stats(filename)
    else
      save_stats(stats, filename)
      stats
    end
  end
end

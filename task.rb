require "date"
class Task < Post
  def initialize
    super
    @due_date = ''
  end
  def read_from_console
    puts "Что вам необходимо сделать?"
    @text = STDIN.gets.encode("UTF-8").chomp
    puts "Какого числа вам необходимо это сделать?"
    puts "Укажите дату в формате ДД.ММ.ГГГГ, например 13.02.2020"
    input = STDIN.gets.chomp
    @due_date = Date.parse(input)
  end
  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")
    file.puts "Сделать #{@due_date.strftime("%Y.%m.%d")}"
    file.puts @text
    file.close
    puts "Ваша задача сохранена"
  end
end
class Memo < Post
  def read_from_console
    puts "Я твой дневник. Я запишу в файл всё, что ты напишешь до строки \"end\"."
    line = nil
    lines = []
    until line == "end"
      line = STDIN.gets.encode("UTF-8").chomp
      @text << line
    end
    @text.pop
  end
  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")
    for item in @text do
      file.puts item
    end
    file.close
    puts "Ваша запись сохранена"
  end
end
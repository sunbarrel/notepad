require_relative "post"
require_relative "link"
require_relative "memo"
require_relative "task"
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__
  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
puts "Привет, я твой блокнот!"
puts "Что хочешь записать?"
choices = Post.post_types
choice = -1
until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts"\t#{index}.#{type}"
  end
  choice = gets.chomp.to_i
end
entry = Post.create choice
entry.read_from_console
entry.save
puts "Ваша запись сохранена!"

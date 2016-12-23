require 'pry'
fifteens = File.open('fifteen.txt', 'r')
small_words = File.open('threes.txt', 'r')

fifteens.each_line do |line|
  count = 0
  matches = []
  small_words.each_line do |word|
    if match = line[word.strip]
      matches.push match
      count += 1
    end
  end
  if count > 5
    puts line
    puts count
  end
  small_words.seek 0
end

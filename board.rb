require 'pry'

class Square

  attr_accessor :bonus

  def presentation
    if @bonus == :triple_word
      "="
    else
      " "
    end
  end
end

class Board

  attr_reader :board

  def initialize
    @board = (0..14).map { |_| (0..14).map { |_| Square.new } }
    triple_words = [[0,0], [0,7], [0,14], [7,0], [14,0], [7,14], [14,7], [14,14]]
    triple_words.each { |pos| board[pos[0]][pos[1]].bonus = :triple_word }
  end

  def play(x, y, direction, word)
   print_board 
  end

  def print_board
    puts "   0 1 2 3 4 5 6 7 8 9 1011121314"
    puts "   ------------------------------"
    @board.each_with_index do |row, y|
      if y < 10
        print " " + y.to_s + "|"
      else
        print y.to_s + "|"
      end
      print( row.map do |square|
        square.presentation
      end.join(" ") )
      puts " |"
    end
    puts "   ------------------------------"
    puts "   0 1 2 3 4 5 6 7 8 9 1011121314"
  end
end

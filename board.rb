require 'pry'

class Square

  attr_accessor :bonus
  attr_accessor :letter

  def presentation
    if @letter
      @letter
    elsif @bonus == :triple_word
      "="
    elsif @bonus == :double_word
      "-"
    elsif @bonus == :triple_letter
      "\""
    elsif @bonus == :double_letter
      "'"
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
    double_words = [[1,1], [2,2], [3,3], [4,4], [7,7],
                    [1,13], [2,12], [3,11], [4,10],
                    [13, 1], [12,2], [11,3], [10,4],
                    [13,13], [12,12], [11,11], [10,10]]
    double_words.each { |pos| board[pos[0]][pos[1]].bonus = :double_word }
    triple_letters = [[1,5], [1,9], [9,1], [5,1],
                      [13,5], [13,9], [9,13], [5,13],
                      [5,5], [5,9], [9,5], [9,9]]
    triple_letters.each { |pos| board[pos[0]][pos[1]].bonus = :triple_letter }
    double_letters = [[3,0], [11,0], [0,3], [0, 11],
                      [3, 14], [11,14], [14,3], [14,11],
                      [6,6], [6,8], [8,6], [8,8],
                      [6,2], [8,2], [2,8], [2,6],
                      [6,12], [8,12], [12,8], [12,6],
                      [3,7], [7,3], [11,7], [7,11]]
    double_letters.each { |pos| board[pos[0]][pos[1]].bonus = :double_letter }
  end

  def play(x, y, direction, word)
    if direction == :down
      word.split("").each_with_index do |letter, i|
        @board[x][y+i].letter = letter
      end
    elsif direction == :right
      word.split("").each_with_index do |letter, i|
        @board[x+i][y].letter = letter
      end
    end
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

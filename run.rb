#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)
require 'board'

puts "Merry Christmas!"
board = Board.new
board.play(7, 7, :right, "word")

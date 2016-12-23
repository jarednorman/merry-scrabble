#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)
require 'board'
require 'csv'

puts "Merry Christmas!"
board = Board.new

CSV.foreach("words2_sorted.csv") do |orig|
  board.play(:right, orig[0])
end

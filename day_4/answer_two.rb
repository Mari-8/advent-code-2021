require_relative "bingo"

lines = File.readlines("#{__dir__}/boards.txt", chomp: true)

boards =
  lines.each_slice(6).map do |set|
    rows = set[0..4].map(&:split)
    board = Bingo::Board.new(rows)
  end 


score = Bingo.find_losing_score(boards) 

binding.irb

puts score
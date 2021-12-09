require_relative "bingo/board"
require_relative "bingo/square" 

module Bingo
  NUMBERS = [50,68,2,1,69,32,87,10,31,21,78,23,62,98,16,99,65,35,27,96,66,26,74,72,45,52,81,60,38,57,54,19,18,77,71,29,51,41,22,6,58,5,42,92,85,64,94,12,83,11,17,14,37,36,59,33,0,93,34,70,97,7,76,20,3,88,43,47,8,79,80,63,9,25,56,75,15,4,82,67,39,30,89,86,46,90,48,73,91,55,95,28,49,61,44,84,40,53,13,24]

  def self.find_winning_score(boards)
    NUMBERS.each do |number|
      boards.each do |board|
        board.mark(number)
        return board.score(number) if board.winning?
      end
    end

    nil
  end

  def self.find_losing_score(boards)
    losing_board = nil
    NUMBERS.each do |number|
      boards.each do |board|
        board.mark(number)
      end

      losing_boards = boards.reject(&:winning?)
      if losing_boards.length == 1 && losing_board.nil?
        losing_board = losing_boards.first
      elsif losing_boards.empty?
        losing_board.mark(number)
        return losing_board.score(number)
      end
    end

    nil
  end
end


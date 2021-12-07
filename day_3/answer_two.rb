require 'csv' 
require_relative 'report'
require_relative 'gamma_rate'
require_relative 'epsilon_rate'
require_relative 'oxygen_rating'
require_relative 'co2_rating'


NUMBER_OF_COLUMNS = 12.freeze

binary_list= CSV.read('day_3/report.csv').flatten

report = Report.new(binary_list)

column_tallies = report.columns.map(&:tally)

gamma_result = GammaRate.new(column_tallies)
epsilon_result = EpsilonRate.new(column_tallies)

oxygen_reader = OxygenRating.new(binary_list)
co2_reader = Co2Rating.new(binary_list)

puts "Life support rating: #{oxygen_reader.generate_oxygen_rating * co2_reader.generate_co2_rating }"



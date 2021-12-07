# array of arrays so you can access nth character of each array of binary?
# gamma rate = most common numb per col
# epsilon rate = least common num per col
# power consumption = gama * epsilon
# "1001".to_i(2) #=> 9

require 'csv' 
require_relative 'report'
require_relative 'gamma_rate'
require_relative 'epsilon_rate'

NUMBER_OF_COLUMNS = 12.freeze

binary_list= CSV.read('day_3/report.csv').flatten

report = Report.new(binary_list)

column_tallies = report.columns.map(&:tally)

gamma_rate = 
  column_tallies.reduce("") do |rate_string, column_tally|
    zero_count = column_tally["0"]
    one_count = column_tally["1"]
    most_common = zero_count > one_count ? "0": "1"
    rate_string + most_common
  end

epsilon_rate = 
  column_tallies.reduce("") do |rate_string, column_tally|
    zero_count = column_tally["0"]
    one_count = column_tally["1"]
    least_common = zero_count < one_count ? "0": "1"
    rate_string + least_common
  end

puts gamma_rate.to_i(2) * epsilon_rate.to_i(2)





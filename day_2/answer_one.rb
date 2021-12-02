# loop over directions 
# based on directions add / subtract from position values 
# down = increase in depth | up decreases depth 
# once destination is reached, multiply final horizontal position by final depth 
require 'csv' 
require_relative 'vector'
require_relative 'journey'

vector_inputs = CSV.read('day_2/commands.csv').flatten

vectors = vector_inputs.map do |input|
    Vector.new(input) 
end 

journey = Journey.new(vectors) 

x, y = journey.destination 

puts "Destination: x: #{x} y: #{y} total: #{x * y}"
require 'csv'

depths = csv.read('day_1/depths.csv').flatten.map(&:to_i)

# loop over each item in depths 
# compare current item to previous item 
# if current item is an incease, add to tally 
# return total number of increases 

total = 0

depths.each_with_index do |depth, index|
    if index == 0 
        next
    end 

    current = depth 
    previous = depths[index - 1]
    
    if current > previous 
        total = total + 1
    end 
end 

puts total

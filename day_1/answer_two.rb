require 'csv'

depths = csv.read('day_1/depths.csv').flatten.map(&:to_i)

# group numbers by 3
# compare each group to previous group
# if there is an increase, add to tally 
# return total number of increases

total = 0

depths.each_with_index do |depth, index|
    if index == 0 
        next
    end 

    previous_item = depths[index - 1]
    first_item = depth 
    second_item = depths[index + 1] 
    third_item = depths[index + 2]

    if third_item == nil 
        break 
    end 

    current_window = first_item + second_item + third_item 
    previous_window = previous_item + first_item + second_item 

    if current_window > previous_window 
        total = total + 1
    end 
end 

puts total

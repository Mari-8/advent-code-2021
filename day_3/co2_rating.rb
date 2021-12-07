require_relative 'smart_tally'

class Co2Rating 
  attr_reader :binary_rows

  def initialize(binary_rows)
    @binary_rows = binary_rows
  end

  def generate_co2_rating
    updated_rows = binary_rows.map(&:clone)
    i = 0 
    while i <= 12 
      new_tally = SmartTally.new(updated_rows) 
      new_columns_tally = new_tally.tally_columns(new_tally.columns) 

      target_column = new_columns_tally[i]
      zero_count = new_columns_tally[i]["0"] ? new_columns_tally[i]["0"] : 0
      one_count = new_columns_tally[i]["1"] ? new_columns_tally[i]["1"] : 0

      if zero_count == one_count 
        updated_rows.delete_if { |row| row[i] == "1" }
        if updated_rows.length == 1 
          break
        end
        next
      end
     
      target_number = zero_count > one_count ? "0" : "1" 
     
      updated_rows.delete_if { |row| row[i] == target_number }

      if updated_rows.length == 1
        break
      end

      i = i + 1
    end 
    updated_rows.join.to_i(2)
  end


end
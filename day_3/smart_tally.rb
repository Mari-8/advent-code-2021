class SmartTally 
    attr_reader :binary_list, :columns

  def initialize(binary_list)
    @binary_list = binary_list
    @columns = convert_to_columns(binary_list) 
  end

  def convert_to_columns(binary_list)
      NUMBER_OF_COLUMNS.times.map do |column_number|
        binary_list.map do |binary_number|
          binary_number[column_number]
        end
      end
  end

  def tally_columns(columns)
    columns.map(&:tally)
  end
  
end
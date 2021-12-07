class Report 
  attr_reader :rows, :columns 

  def initialize(binary_list)
    @rows = binary_list 
    @columns = 
        NUMBER_OF_COLUMNS.times.map do |column_number|
          binary_list.map do |binary_number|
            binary_number[column_number]
        end
    end
  end


end
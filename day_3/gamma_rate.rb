class GammaRate 
  def initialize(binary_list)
    @binary_list = binary_list
  end

  def generate_gamma
    @binary_list.reduce("") do |rate_string, binary_list|
      zero_count = binary_list["0"]
      one_count = binary_list["1"]
    
      most_common = zero_count > one_count ? "0": "1"
      rate_string + most_common
    end.to_i(2)
  end
end

class EpsilonRate
  def initialize(binary_list)
    @binary_list = binary_list
  end

  def generate_epsilon
    @binary_list.reduce("") do |rate_string, binary_list|
      zero_count = binary_list["0"]
      one_count = binary_list["1"]
    
      least_common = zero_count < one_count ? "0": "1"
      rate_string + least_common
    end.to_i(2)
  end
end
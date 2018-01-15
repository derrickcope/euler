#!/usr/bin/env ruby
#
# euler#39.rb
# 2017-12-06

perimeter_ary = Array.new(4_000, 0)

1.upto(700) do |side_a|
  1.upto(700) do |side_b|
    hypotenuse = Math.sqrt((side_a ** 2) + (side_b ** 2))
    if (hypotenuse % 1).zero?
      perimeter = hypotenuse + side_a + side_b 
      perimeter_ary[perimeter] += 1
    end
  end
end

p perimeter_ary.index(perimeter_ary.max)
    



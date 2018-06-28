#!/usr/bin/env ruby
#
# euler#43.rb
# 2018-05-16
#

class Integer
  def divisibility?
    num_str = self.to_s
    [num_str[1..3].to_i % 2 == 0, num_str[2..4].to_i % 3 == 0, num_str[3..5].to_i % 5 == 0, num_str[4..6].to_i % 7 == 0,
            num_str[5..7].to_i % 11 == 0, num_str[6..8].to_i % 13 == 0, num_str[7..9].to_i % 17 == 0].all?
  end
end

tthen = Time.now
can_ary = []
pan_ary = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

pan_ary.permutation.each do |can|
  puts can.join
  can_ary.push(can.join.to_i) if can.join.to_i > 1000000000 && can.join.to_i.divisibility?
end

p can_ary
puts can_ary.sum

now = Time.now

puts now - tthen

#!/usr/bin/env ruby
#
# euler#32.rb
# 2017-10-29
#

class Array# determines if all 9 digits are in the array by using #& method, boolean 
  def include_all?
    (self & [1,2,3,4,5,6,7,8,9]).count == 9
  end
end

t0 = Time.now

limit = 2000 # calculate up or down to this limit
pan_ary = Array.new # array of pandigit products

1.upto(limit) { |cand| limit.downto(1) do |plier| # I didn,t know you could nest a do statement in a block 
  test_ary = [] # array for putting multiplicand, multiplier, and product
  test_ary.concat(plier.to_s.chars.map(&:to_i),cand.to_s.chars.map(&:to_i),(plier * cand).to_s.chars.map(&:to_i))
  # put the numbers into an array as individual numbers 
  pan_ary.push(plier * cand) if test_ary.count == 9 && test_ary.include_all?
  # test to see if the array is the correct length and if it contains all 9 digits
end
}
p pan_ary.uniq.sort
# print array of pandigit products
p pan_ary.uniq.sort.sum
# print sum of pandigit products

puts Time.now - t0
# not so fast at 16s

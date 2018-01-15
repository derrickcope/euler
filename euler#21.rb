#!/usr/bin/env ruby
#
# euler#21.rb
#
#Amicable numbers
#Problem 21

#Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
#If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
#For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
#Evaluate the sum of all the amicable numbers under 10000.
#

class Integer

  def prop_div
    factary = Array.new
    1.upto(self/2) do |divisor|
      factary.push(divisor) if (self % divisor).zero? 
    end
    factary.sum
  end
  def amicable?
    self == self.prop_div.prop_div && self.prop_div != self
  end
end

t0 = Time.now

amic_ary = Array.new

2.upto(10000) do |cand_num|
  amic_ary.push(cand_num) if cand_num.amicable?
end

puts amic_ary.sum

puts "elaspsed time #{Time.now - t0}"

#!/usr/bin/env ruby
#
# euler#34.rb
# 2017-10-30
#
#########################################################################################################
#########################################################################################################
## Digit factorials
## Problem 34
## 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
## Find the sum of all numbers which are equal to the sum of the factorial of their digits.
## Note: as 1! = 1 and 2! = 2 are not sums they are not included.
##                                                                                                  ##
#########################################################################################################
#########################################################################################################

class Integer
  def curious?
    int_ary = self.to_s.split(//).map(&:to_i)
    int_ary.map! { |n| n == 0 ? 1 : n }
    int_ary.map! { |n| n.downto(1).inject(&:*) }
    self == int_ary.sum
  end
end

t0 = Time.now
curious_ary = Array.new
3.upto(100_000) { |test| curious_ary.push(test) if test.curious? }

puts curious_ary.sum

puts Time.now - t0

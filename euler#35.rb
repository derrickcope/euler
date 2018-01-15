#!/usr/bin/env ruby
#
# euler#35.rb
# 2017-11-09
#
#######################################################################################################
#######################################################################################################
##                                                                                                   ##
##                                                                                                   ##
##                                                                                                   ##
##                                                                                                   ##
##                                                                                                   ##
#######################################################################################################
#######################################################################################################



require 'prime'

class Integer

  def is_prime?
    2.upto(self/2).none? { |i| self % i == 0 }
  end
  def is_circular?
    prime_ary = Array.new
    test_ary = self.to_s.split(//)
    (test_ary.size).times do
      test_number = test_ary.rotate!.join.to_i
      prime_ary.push(test_number) if test_number.prime?
    end
    prime_ary.size == self.to_s.split(//).size
  end
end

t0 = Time.now
circular_ary = Array.new

2.upto(1_000_000) do |test_int|
  if test_int.prime?
  circular_ary.push(test_int) if test_int.is_circular?
  end
end

p circular_ary.size
p circular_ary

p Time.now - t0

#!/usr/bin/env ruby
#
# euler#41.rb
# 2018-01-28

require 'prime'

class Array
  def pan?
  (self & [1,2,3,4,5,6,7]).count == 7
  end
end

pan_ary = Array.new

Prime.each(1_000_000_0) do |prime|
  puts prime
  pan_ary.push(prime) if prime.to_s.split(//).map(&:to_i).pan?
end

puts pan_ary

puts "answer #{pan_ary.max}"

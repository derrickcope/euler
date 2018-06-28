#!/usr/bin/env ruby
#
# euler#58.rb
# 2018-03-02

require 'prime'

numb_ary = [1]
prime_ary = []
(3..29999).step(2) do |side|
  numb_ary << (numb_ary.last + (side - 1))
  numb_ary << (numb_ary.last + (side - 1))
  numb_ary << (numb_ary.last + (side - 1))
  numb_ary << (numb_ary.last + (side - 1))
  #prime_ary = []
  numb_ary[-4..-1].each do |can|
    prime_ary.push(can) if can.prime?
  end
  #puts prime_ary.size
  #puts numb_ary.size
  #puts side
  puts side, ((prime_ary.size.to_f / numb_ary.size.to_f) * 100) if ((prime_ary.size.to_f / numb_ary.size.to_f) * 100) < 10.0
  break if ((prime_ary.size.to_f / numb_ary.size.to_f) * 100) < 10
end

#p numb_ary

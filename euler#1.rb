#!/usr/bin/env ruby
#
# euler#1.rb
# 2018-01-15

ans_ary = Array.new

1.upto(999) do |num|
  ans_ary.push(num) if num % 3 == 0 or num % 5 == 0
end

puts ans_ary.sum


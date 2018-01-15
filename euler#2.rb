#!/usr/bin/env ruby
#
# euler#2.rb
# 2018-01-15

a,b = 1,2
fib_ary = [a]

begin 
  fib_ary.push(b) if b % 2 == 0
  a,b = b, a + b
end until b >= 4_000_000

puts fib_ary.sum

#!/usr/bin/env ruby
#
# euler#3.rb
# 2018-01-15

require 'prime'

factor = 600851475143

(Math.sqrt(factor)).to_i.downto(1) do |num|
  if factor % num == 0 and Prime.prime?(num)
    puts num
    break
  end
end


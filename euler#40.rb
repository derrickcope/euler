#!/usr/bin/env ruby
#
# euler#40.rb
# 2018-01-28

num = String.new


1.upto(1_000_000) do |number|

  num += number.to_s
end

puts num[0].to_i * num[9].to_i * num[99].to_i * num[999].to_i * num[9999].to_i * num[99999].to_i * num[999999].to_i

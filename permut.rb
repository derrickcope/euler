#!/usr/bin/env ruby
#
# permut.rb
# 2018-05-21

pan_ary = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

pan_ary.permutation.each do |can|
  puts can.join
end

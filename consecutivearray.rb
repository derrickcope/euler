#!/usr/bin/env ruby
#
# consecutivearray.rb
# 2018-02-26


string = "8S 5S 6D 4H 7C"

hand_ary = string.gsub(/T/, "10").gsub(/A/, "14").gsub(/J/, "11").gsub(/Q/, "12").gsub(/K/, "13").gsub(/[CHDS]/," ").split(" ").sort
  #.group_by {|i| i[1]}

puts "consecutive" if ((hand_ary[-1].to_i - hand_ary[0].to_i) + 1) == hand_ary.size



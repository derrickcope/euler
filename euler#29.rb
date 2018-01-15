#!/usr/bin/env ruby
#
# euler#29.rb
#
pro_ary = Array.new

2.upto(100) { |i| 2.upto(100) {|j| pro_ary.push(i ** j)} }

puts pro_ary.uniq.sort.size

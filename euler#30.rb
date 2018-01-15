#!/usr/bin/env ruby
#
# euler#30.rb
# 2017-10-27
#
tar_ary = Array.new
100.upto(1000000) { |count| tar_ary.push(count) if count.digits.map {|digit| digit**5}.sum == count }
p tar_ary.sum

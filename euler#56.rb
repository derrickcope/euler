#!/usr/bin/env ruby
#
# euler#56.rb
# 2018-03-02
sum = 0

1.upto(99) do |a|
  1.upto(99) do |b|
   # p (a ** b ).to_s.split(//)
    sum = (a ** b).to_s.split(//).map!(&:to_i).sum if (a ** b).to_s.split(//).map!(&:to_i).sum > sum
  end
end

p sum

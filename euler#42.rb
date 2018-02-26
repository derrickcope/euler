#!/usr/bin/env ruby
#
# euler#42.rb
# 2018-01-29

class String

  def avalue
    sum = 0
    self.each_byte do |c|
      sum += c - 64
    end
    sum
  end
end


triangle_ary = Array.new
value_ary = Array.new
count = 0

word_ary = File.open("words.txt").read.delete("\"").split(/,/)


word_ary.each do |word|
  value_ary.push(word.avalue)
end


1.upto(100) do |i|
  triangle_ary.push((i * (i + 1) / 2))
end

value_ary.each do |val|
  count += 1 if triangle_ary.include?(val)
end

puts count

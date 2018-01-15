#!/usr/bin/env ruby
#
# euler12.rb
#
include Math

class Integer

  def triangle()
    sum = 0
    1.upto(self) do |i|
      sum += i
    end
    sum
  end

  def factors()
    (1..Math.sqrt(self)).select { |n| (self % n).zero? }
  end
      
end


facarr = []
numtri = 1000

while true
  puts "triangle number is: #{numtri.triangle}"
  facarr = numtri.triangle.factors
  puts "number of factors is: #{facarr.length}"
  if (facarr.length) * 2 > 499
    break
  else
  numtri += 1
  end
end

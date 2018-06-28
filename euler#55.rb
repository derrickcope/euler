#!/usr/bin/env ruby
#
# euler#55.rb
# 2018-03-02

class Integer

  def ispalindrome?
    self.to_s.reverse == self.to_s
  end

end

count = 0


10.upto(10_000) do |num|
  it = 1
  puts "trying #{num}"
  50.times do
    num += num.to_s.reverse.to_i
    break if num.ispalindrome?
    case it
    when 50
      puts "found one #{num}"
      count += 1
    else 
       it += 1
    end
  end
end

puts count

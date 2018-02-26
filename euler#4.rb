#!/usr/bin/env ruby
#
# euler#4.rb
# 2018-01-15

class Integer

  def palin?
    self.to_s == self.to_s.reverse
  end

end

palin_ary = Array.new

999.downto(100) do |firstnum|
  999.downto(100) do |secnum|
    palin_ary.push(firstnum * secnum) if (firstnum * secnum).palin?
  end
end

puts palin_ary.max

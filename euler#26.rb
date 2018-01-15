#!/usr/bin/env ruby
#
# euler#26.rb
#


require 'bigdecimal'
require 'bigdecimal/math'

include BigMath

class BigDecimal
  
  def repeatseq
    (self.to_s('F')).split(".").last.match(/^\d*(\d+)\1+/)
    $1
  end
end
  
repeat_ary = Array.new  
n = 2.0
while n < 100

  ans = (BigDecimal.new("1.0",100)/BigDecimal.new("#{n}",100)).to_s('F')
  p ans
  #repeat_ary.push(ans.repeatseq.to_i)
  #puts ans.repeatseq
  puts n
  n += 1

end

puts repeat_ary.max
puts repeat_ary.index(repeat_ary.max)



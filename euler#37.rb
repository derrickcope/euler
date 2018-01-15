#!/usr/bin/env ruby
#
# euler#37.rb
# 2017-11-24
#

require 'prime'

class Integer

  def drop_first
    self.to_s.split('').drop(1).join.to_i
  end

  def drop_last
    self.to_s.chop.to_i
  end
  
  def truncate_left?
    num = self.drop_last
    dig_len = num.to_s.length
    dig_len.times do |i|
      unless num.prime?
        break
      else
        num = num.drop_last
      end
      self if i == (dig_len - 1)
    end
  end

  def truncate_right?
    num = self.drop_first
    dig_len = num.to_s.length
    dig_len.times do |i|
      unless num.prime?
        break
      else
        num = num.drop_first
      end
      self if i == (dig_len - 1)
    end
  end


end

truncate_prime_ary = Array.new

Prime.each(1_000_000) do |num|
  #puts num
  if num < 10
    next
  else
    truncate_prime_ary.push(num) if num.truncate_left? and num.truncate_right?
  end

end
p truncate_prime_ary.inject(&:+)


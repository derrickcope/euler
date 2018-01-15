#!/usr/bin/env ruby
#
# euler14.rb
#
# Problem 14 Longest Collatz Sequence
t0 = Time.now

def number_sequence(collatz)
  collatzary = [collatz]
  until collatz == 1
    if collatz % 2 == 0
      collatz = collatz / 2
    else
      collatz = collatz * 3 + 1
    end
    collatzary.push(collatz)
  end 
 collatzary
end

lenhash = Hash.new

13.upto(1000000) do |enum|
#  puts enum
  lenhash[enum] = number_sequence(enum).length
#  puts number_sequence(enum).length
end

puts lenhash.max_by {|k,v| v }

puts "run time #{Time.now - t0}"

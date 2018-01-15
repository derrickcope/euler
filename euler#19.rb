#!/usr/bin/env ruby
#
# euler.19.rb
#


require 'date'

thedate = Date.new(1901,1,1)
sum = 0

while thedate.to_s != "2001-01-01"
  sum += 1 if thedate.sunday?
  thedate = thedate.next_month
end

puts sum




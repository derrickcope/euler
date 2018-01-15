#!/usr/bin/env ruby
#
# euler17.rb
#Number letter counts

#Problem 17
#
#If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
#If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#
#NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
#

class String
  
  def count
    hundredhash = { "1"  => "one", "2" => "two", "3" => "three", "4" => "four", "5" => "five", "6" => "six", "7" => "seven", "8" => "eight", "9" => "nine"}
    tenhash = { "0" => "", "2" => "twenty", "3" => "thirty", "4" => "forty", "5" => "fifty", "6" => "sixty", "7" => "seventy", "8" => "eighty", "9" => "ninety" }
    teenhash = { "0" => "ten","1" => "eleven", "2" => "twelve", "3" => "thirteen", "4" => "fourteen", "5" => "fifteen", "6" => "sixteen", "7" => "seventeen", "8" => "eighteen", "9" => "nineteen" } 
    numary = self.split(//)

    if numary.length == 3
      if numary[1] == "0" and numary[2] == "0"
        hundredplace = hundredhash[numary[0]]
        numwrit = "#{hundredplace} hundred"
      elsif numary[1] == "1"
        hundredplace = hundredhash[numary[0]]
        oneplace = teenhash[numary[2]]
        numwrit = "#{hundredplace} hundred and #{oneplace}"
      else 
        hundredplace = hundredhash[numary[0]]
        tenplace = tenhash[numary[1]]
        oneplace = hundredhash[numary[2]]
        numwrit = "#{hundredplace} hundred and #{tenplace}-#{oneplace}"
      end
    elsif numary.length == 2
      unless numary[0] == "1"
        tenplace = "#{tenhash[numary[0]]}"
        oneplace = "#{hundredhash[numary[1]]}"
        numwrit = tenplace + oneplace
      else
        oneplace = "#{teenhash[numary[1]]} "
        numwrit = oneplace
      end
    elsif numary.length == 4
      thousandplace = hundredhash[numary[0]]
      numwrit = "#{thousandplace} thousand"
    else
      oneplace = "#{hundredhash[numary[0]]}"
      numwrit = oneplace
    end
    puts numwrit
    numwrit.delete("\s-").length
  end

end

sum = 0

1.upto(1000) do |str|

  puts str
  
  str = str.to_s
  numberlength = str.count
  puts numberlength
  sum += numberlength
  puts sum
end

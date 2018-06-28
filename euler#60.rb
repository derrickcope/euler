#!/usr/bin/env ruby
#
# euler#60.rb
# 2018-06-01
#

require 'prime'


class Array 
  def prime_series?
    prime_series_ary = Array.new
    self.permutation(2).each do |primenum|
      prime_series_ary.push(primenum.join.to_i)
    end
    prime_series_ary if prime_series_ary.all? {|ind| ind.prime?}
  end
end

prime_can = 130
solutions_ary = []
prime_series_ary = []
prime_ary_one = Prime.first(prime_can)
prime_ary_two = Prime.first(prime_can)
prime_ary_three = Prime.first(prime_can)
prime_ary_four = Prime.first(prime_can)
prime_ary_five = Prime.first(prime_can)
prime_series_ary = prime_ary_one.product(prime_ary_two, prime_ary_three, prime_ary_four)

prime_series_ary.each do |arr|
  p arr if arr.prime_series?
end

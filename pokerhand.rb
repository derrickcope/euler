#!/usr/bin/env ruby
#
# pokerhand.rb
# 2018-03-02

require 'ruby-poker'


count = 0
pokerhands_ary = File.open("poker.txt").read.split(/\n/)

pokerhands_ary.each do |game|
  hand1 = PokerHand.new(game[0..13])
  hand2 = PokerHand.new(game[15..-1])
  count += 1 if hand1 > hand2
end

puts count

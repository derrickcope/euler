#!/usr/bin/env ruby
#
# euler#54.rb
# 2018-02-20

class PokerHand < String

  $count = 0

  attr_accessor :cards, :got

  def initialize(cards)
    @cards = cards
  end
  def highcard
    cards_ary = cards.gsub(/T/, "10").gsub(/A/, "14").gsub(/Q/, "12").gsub(/K/, "13").gsub(/J/, "11").gsub(/[CHDS]/, "  ").split(" ")
    @got = ["high card", cards_ary.map!(&:to_i).max]
  end
  def pair
    pairs_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[0]}
    freq_hsh.each do |face,pairs|
      pairs_ary.push(face) if pairs.size == 2
    end
    if pairs_ary.size == 1
      @got = ["one pair", pairs_ary[0]]
    end
  end
  def twopair
    pairs_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[0]}
    freq_hsh.each do |face,pairs|
      pairs_ary.push(face) if pairs.size == 2
    end
    if pairs_ary.size ==2
      @got = ["two pairs", pairs_ary[0], pairs_ary[1]]
    end
  end
  def consecutive?
    consec_ary = cards.gsub(/T/, "10").gsub(/A/, "14").gsub(/J/, "11").gsub(/Q/, "12").gsub(/K/, "13").gsub(/[CHDS]/, " ").split(" ").uniq.map!(&:to_i).sort
    ((consec_ary[-1] - consec_ary[0]) + 1) == 5 and consec_ary.size == 5
  end
  def straight
    @got =  ["straight", cards.split(" ").max] if self.consecutive?
  end
  def straightflush
    flush_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[1]}
    freq_hsh.each do |suit,value|
      flush_ary.push(suit) if value.size == 5
    end
    @got = ["straight flush", cards.split(" ").max] if self.consecutive? and flush_ary.size == 1
  end
  def threekind
    kind_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[0]}
    freq_hsh.each do |face,three|
      kind_ary.push(face) if three.size == 3
    end
    if kind_ary.size >= 1
      @got = ["three of a kind", kind_ary[0]]
    end
  end
  def fullhouse
    three_ary = []
    two_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[0]}
    freq_hsh.each do |face,value|
      three_ary.push(face) if value.size == 3
      two_ary.push(face) if value.size == 2
    end
    if three_ary.size == 1 and two_ary.size == 1
      @got = ["full house", three_ary[0], two_ary[0]]
    end
  end
  def fourkind
    four_ary ||= []
    freq_hsh = cards.split(" ").group_by {|i| i[0]}
    freq_hsh.each do |face,value|
      four_ary.push(face) if value.size == 4
    end
    if four_ary.size == 1 
      @got = ["four of a kind", four_ary[0]]
    end
  end
  def flush
    flush_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[1]}
    freq_hsh.each do |suit, value|
      flush_ary.push(suit) if value.size == 5
    end
    if flush_ary.size == 1
      @got = ["flush", flush_ary[0]]
    end
  end
  def rank
    case
    when self.straightflush
      got.unshift 90 if got
    when self.fourkind
      got.unshift 80 if got
    when self.fullhouse
      got.unshift 70 if got
    when self.straight
      got.unshift 60 if got
    when self.flush
      got.unshift 50 if got
    when self.threekind
      got.unshift 40 if got
    when self.twopair
      got.unshift 30 if got
    when self.pair
      got.unshift 20 if got
    when self.highcard
      got.unshift got[1].to_i
    else
      got = [0]
    end
  end
  def compare(player2)
    if self.rank[0] == player2.rank[0]
      if self.rank[2].gsub(/T/, "10").gsub(/J/, "11").gsub(/Q/, "12").gsub(/K/, "13").gsub(/A/, "14").to_i > player2.rank[2].gsub(/T/, "10").gsub(/J/, "11").gsub(/Q/, "12").gsub(/K/, "13").gsub(/A/, "14").to_i 
        #puts "player one wins with #{self.rank} #{player2.rank}"
        $count += 1
      else
        #puts "player two wins with #{player2.rank} #{self.rank}"
      end
    elsif self.rank[0] > player2.rank[0]
      #"player one wins with #{self.rank}"
      $count += 1
    else
      #"player two wins with #{player2.rank}"
    end
  end
end


pokerhands_ary = File.open("poker.txt")

pokerhands_ary.each do |game|
#  hand1 = PokerHand.new("2S 2S 3S 3S 3S")
#  hand2 = PokerHand.new("2S 3D 3C AS KH")
#  puts hand1.compare(hand2)

  hand1 = PokerHand.new(game[0..13])
  hand2 = PokerHand.new(game[15..-1])
  hand1.compare(hand2)

#puts "flush" if hand1.compare(hand2) == "player one wins with 40" or hand1.compare(hand2) == "player two wins with 40"
#puts hand1.rank
end
puts $count

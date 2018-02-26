#!/usr/bin/env ruby
#
# euler#54.rb
# 2018-02-20

class PokerHand 

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def pairs
    pairs_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[0]}
    freq_hsh.each do |face,pairs|
      pairs_ary.push(face) if pairs.size == 2
    end
    if pairs_ary.size == 2
      return "two pairs"
    elsif pairs_ary.size == 1
      return "one pair"
    end
  end
  def threekind
    kind_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[0]}
    freq_hsh.each do |face,three|
      kind_ary.push(face) if three.size == 3
    end
    if kind_ary.size >= 1
      return "three of a kind"
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
      return "full house"
    end
  end
  def fourkind
    four_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[0]}
    freq_hsh.each do |face,value|
      four_ary.push(face) if value.size == 4
    end
    if four_ary.size == 1 
      return "four of a kind"
    end
  end
  def flush
    flush_ary = []
    freq_hsh = cards.split(" ").group_by {|i| i[1]}
    freq_hsh.each do |suit, value|
      flush_ary.push(suit) if value.size == 5
    end
    if flush_ary.size == 1
      return "flush"
    end
  end
  def rank
    case
    when self.fourkind == "four of a kind"
      return 60
    when self.fullhouse == "full house"
      return 50
    when self.flush == "flush"
      return 40
    when self.threekind == "three of a kind"
      return 30
    when self.pairs == "two pairs"
      return 20
    when self.pairs == "one pair"
      return 10
    else
      return 0
    end
  end
  def compare(player2)
    if self.rank == player2.rank
      "player one and player two tie"
    elsif self.rank > player2.rank
      "player one wins with #{self.rank}"
    else
      "player two wins with #{player2.rank}"
    end
  end
end


pokerhands_ary = File.open("poker.txt").read.split(/\n/)

pokerhands_ary.each do |game|
#  hand1 = PokerHand.new("4S 3S 5S 8S 4S")
#  hand2 = PokerHand.new("2S 3D 3C AS KH")
  hand1 = PokerHand.new(game[0..13])
  hand2 = PokerHand.new(game[15..-1])
  puts hand1.compare(hand2)

#puts "flush" if hand1.compare(hand2) == "player one wins with 40" or hand1.compare(hand2) == "player two wins with 40"

end

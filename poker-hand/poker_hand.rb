class PokerHand
  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

  def rank
    value_count = card_values.values
    suit_count = card_suits.values
    return "Four of a Kind" if value_count.include?(4)
    return "Full House" if value_count.include?(3) and value_count.include?(2)
    return "Flush" if suit_count.include?(5)
    return "Three of a Kind" if value_count.include?(3)
    return "2 Pair" if value_count.grep(2).size == 2
  end

  private

    def card_values
      hand.each_with_object(Hash.new(0)) do |card, card_values|
        card_values[card.chop] += 1
      end
    end

    def card_suits
      hand.each_with_object(Hash.new(0)) do |card, suits|
        suits[card[-1]] += 1
      end
    end
end


# Write some code that will evaluate a poker hand and determine its
# rank.
#
# Example:
# Hand: Ah As 10c 7d 6s (Pair of Aces)
# Hand: Kh Kc 3s 3h 2d (2 Pair)
# Hand: Kh Qh 6h 2h 9h (Flush)

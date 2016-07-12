class PokerHand
  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

  def rank
    return multiples if multiples
    return "Flush" if flush
  end

  private

    def multiples
      card_values = hand.each_with_object(Hash.new(0)) do |card, card_values|
        card_values[card.chop] += 1
      end
      return "Four of a Kind" if card_values.values.include?(4)
      return "Full House" if card_values.values.include?(3) and card_values.values.include?(2)
      return "Three of a Kind" if card_values.values.include?(3)
      # return "2 Pair" if card_values.values.count(2)
      return nil
    end

    def flush
      card_suits = hand.each_with_object(Hash.new(0)) do |card, suits|
        suits[card[-1]] += 1
      end
      card_suits.values.include?(5)
    end
end


# Write some code that will evaluate a poker hand and determine its
# rank.
#
# Example:
# Hand: Ah As 10c 7d 6s (Pair of Aces)
# Hand: Kh Kc 3s 3h 2d (2 Pair)
# Hand: Kh Qh 6h 2h 9h (Flush)

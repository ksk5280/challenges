class PokerHand
  attr_reader :hand, :value_count, :suit_count

  def initialize(hand)
    @hand = hand
    @value_count = card_values.values
    @suit_count = card_suits.values
  end

  def rank
    return "Royal Flush" if straight_with_ace_high and flush
    return "Straight Flush" if straight and flush
    return "Four of a Kind" if value_count.include?(4)
    return "Full House" if value_count.include?(3) and value_count.include?(2)
    return "Flush" if flush
    return "Straight" if straight
    return "Three of a Kind" if value_count.include?(3)
    return "2 Pair" if value_count.grep(2).size == 2
  end

  private

    def flush
      suit_count.include?(5)
    end

    def straight
      diff_cards = value_count.size == 5
      four_nums_between_max_and_min = (card_values.keys.max.to_i - card_values.keys.min.to_i) == 4
      diff_cards and (four_nums_between_max_and_min or straight_with_ace_high)
    end

    def straight_with_ace_high
      card_values.keys.sort == [1, 10, 11, 12, 13]
    end

    def card_values
      face_cards = {
        "A" => 1,
        "K" => 13,
        "Q" => 12,
        "J" => 11
      }
      hand.each_with_object(Hash.new(0)) do |card, card_values|
        if card.chop.to_i == 0
          card_value = face_cards[card.chop]
        else
          card_value = card.chop.to_i
        end
        card_values[card_value] += 1
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

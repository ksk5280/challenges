class PokerHand
  attr_reader :hand, :card_values, :value_count, :suit_count

  CARDS = {
    1 => "Aces",
    2 => "Twos",
    3 => "Threes",
    4 => "Fours",
    5 => "Fives",
    6 => "Sixes",
    7 => "Sevens",
    8 => "Eights",
    9 => "Nines",
    10 => "Tens",
    11 => "Jacks",
    12 => "Queens",
    13 => "Kings"
  }

  def initialize(hand)
    @hand = hand
    @card_values = card_values
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
    return "Pair of #{pair_string}" if pair_string
    "High Card"
  end

  private

    def pair_string
      pair = card_values.select {|k, v| v == 2}.keys[0]
      CARDS[pair]
    end

    def flush
      suit_count.include?(5)
    end

    def straight
      diff_cards = value_count.size == 5
      four_nums_between_max_and_min = (card_values.keys.max - card_values.keys.min) == 4
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

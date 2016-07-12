class PokerHand
  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

  def rank
    return "Flush" if flush
  end

  private

    def flush
      suits = {
        "h" => 0,
        "d" => 0,
        "s" => 0,
        "c" => 0
      }
      hand.each do |card|
        suits[card[-1]] += 1
      end
      suits.values.include?(5)
    end
end


# Write some code that will evaluate a poker hand and determine its
# rank.
#
# Example:
# Hand: Ah As 10c 7d 6s (Pair of Aces)
# Hand: Kh Kc 3s 3h 2d (2 Pair)
# Hand: Kh Qh 6h 2h 9h (Flush)

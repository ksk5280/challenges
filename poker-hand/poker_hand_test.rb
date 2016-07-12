require_relative "poker_hand"
require "minitest/autorun"
require "minitest/pride"

class PokerHandTest < Minitest::Test
  def test_class_exists
    assert PokerHand
  end

  def test_pair
    hand = PokerHand.new(["Ah", "As", "10c", "7d", "6s"])
    assert_equal "Pair of Aces", hand.rank
  end

  def test_flush
    hand = PokerHand.new(["Ah", "5h", "10h", "Kh", "3h"])
    assert_equal "Flush", hand.rank
  end
end

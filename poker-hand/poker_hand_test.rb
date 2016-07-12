require_relative "poker_hand"
require "minitest/autorun"
require "minitest/pride"

class PokerHandTest < Minitest::Test
  def test_class_exists
    assert PokerHand
  end

  def test_ranks_flush
    hand = PokerHand.new(["Ah", "5h", "10h", "Kh", "3h"])
    assert_equal "Flush", hand.rank
  end

  def test_ranks_four_of_a_kind
    hand = PokerHand.new(["Ah", "As", "Ad", "Ac", "2c"])
    assert_equal "Four of a Kind", hand.rank
  end

  def test_ranks_full_house
    hand = PokerHand.new(["Ah", "As", "Ad", "2s", "2c"])
    assert_equal "Full House", hand.rank
  end

  def test_ranks_three_of_a_kind
    hand = PokerHand.new(["Ah", "As", "Ad", "5s", "2c"])
    assert_equal "Three of a Kind", hand.rank
  end

  def test_ranks_pair
    skip
    hand = PokerHand.new(["Ah", "As", "10c", "7d", "6s"])
    assert_equal "Pair of Aces", hand.rank
  end
end

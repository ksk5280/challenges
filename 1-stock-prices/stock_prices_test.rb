require_relative 'stock_prices'
require 'minitest/autorun'
require 'minitest/pride'

class StockPricesTest < Minitest::Test
  def test_stock_prices_class_exists
    assert StockPrices
  end

  def test_returns_difference_max_profit_for_two_numbers
    sp = StockPrices.new
    stock_prices_yesterday = [1, 5]

    assert_equal 4, sp.get_max_profit(stock_prices_yesterday)
  end

  def test_returns_difference_max_profit_for_three_numbers
    sp = StockPrices.new
    stock_prices_yesterday = [3, 2, 7]

    assert_equal 5, sp.get_max_profit(stock_prices_yesterday)
  end

  def test_returns_difference_max_profit_for_five_numbers
    sp = StockPrices.new
    stock_prices_yesterday = [3, 2, 7, 4, 10]

    assert_equal 8, sp.get_max_profit(stock_prices_yesterday)
  end

  def test_returns_difference_max_profit_for_six_numbers
    sp = StockPrices.new
    stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

    assert_equal 6, sp.get_max_profit(stock_prices_yesterday)
  end

  def test_returns_difference_max_profit_for_ten_numbers
    sp = StockPrices.new
    stock_prices_yesterday = [10, 7, 15, 8, 11, 9, 30, 1, 25, 15, 35]

    assert_equal 34, sp.get_max_profit(stock_prices_yesterday)
  end
end

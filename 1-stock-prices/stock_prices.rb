require 'pry'

class StockPrices
  def get_max_profit(stock_prices)
    max_profit = stock_prices[1] - stock_prices[0]
    length = stock_prices.length
    while length > 1
      num = 2
      while length >= num
        diff = stock_prices[length - 1] - stock_prices[length - num]
        if diff > max_profit
          max_profit = diff
        end
        num += 1
      end
      length -= 1
    end
    max_profit
  end
end

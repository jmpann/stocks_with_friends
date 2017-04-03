class Stock < ApplicationRecord

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.new_from_lookup(ticker_symbol)
    stock_data = StockQuote::Stock.quote(ticker_symbol)
    return nil unless stock_data.name

    new_stock = new(ticker: stock_data.symbol, name: stock_data.name)
    new_stock.last_price = new_stock.price
    new_stock
  end

  def price
    closing_price = StockQuote::Stock.quote(ticker).close
    opening_price = StockQuote::Stock.quote(ticker).open
    if closing_price
      closing_price
    elsif opening_price
      opening_price
    else
      "Unvailable"
    end
  end


end

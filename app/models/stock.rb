class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.new_from_lookup(ticker_symbol)
    begin
      StockQuote::Stock.new(api_key: ENV["API_KEY"])
      lookep_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: lookep_up_stock.company_name, ticker: lookep_up_stock.symbol, last_price: lookep_up_stock.latest_price)
    rescue Exception => e
      return nil
    end
  end
end

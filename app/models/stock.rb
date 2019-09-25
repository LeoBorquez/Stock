class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.new_from_lookup(ticker_symbol)
    begin
      StockQuote::Stock.new(api_key: 'pk_d5d0395ac86d4801955d4677f7da1a0e')
      lookep_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: lookep_up_stock.company_name, ticker: lookep_up_stock.symbol, last_price: lookep_up_stock.latest_price)
    rescue Exception => e
      return nil
    end
  end
end

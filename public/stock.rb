require 'httparty'
require 'nokogiri'
require 'sinatra'
require 'json'

class StockTicker
  def initialize(user_stock)
    @symbol = user_stock
    @stock = HTTParty.get("http://finance.yahoo.com/q?s=#{@symbol}")
    @dom = Nokogiri::HTML(@stock.body)
  end

  def get_current_price
    stock_price = @dom.xpath("//span[@id='yfs_l84_#{@symbol}']").first
  end

  def get_prev_close
    prev_close = @dom.xpath("//td[@class='yfnc_tabledata1']").first
  end
end

stockticker1 = StockTicker.new('aapl')
stockticker_docur = stockticker1.get_current_price
#stockticker1.get_prev_close

get '/' do
  "Apple Inc(AAPL):   $#{stockticker_docur}"
end

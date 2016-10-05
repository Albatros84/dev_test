require 'open-uri'

class PanelProvider < ActiveRecord::Base

  TimeNews="http://time.com"
  AjaxGoogleApi="https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news"

  def self.panel1_price(letter='a') 
    Nokogiri::HTML(open(TimeNews)).text.scan("#{letter}").count/100.0
  end

  def self.panel2_price(substring='\u003cb\u003e')
    JSON.parse(open(AjaxGoogleApi).read).scan(/(?=#{substring})/).count
  end  

  def self.panel3_price
    Nokogiri::HTML(open(TimeNews).read).xpath("//*").map(&:name).count/100.0
  end

end


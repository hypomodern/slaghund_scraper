require "slaghund_scraper/version"
require "excon"
require 'nokogiri'

class SlaghundScraper
  attr_accessor :response

  SLAGHUND = 'http://84.205.248.92/slaghund/slagview.aspx'

  def fetch_data
    self.response = Excon.get(SLAGHUND)
  end

  def nokogirize response = self.response
    if response.status == 200
      Nokogiri::HTML(response.body)
    else
      raise StandardError.new("Response was: #{response.status}")
    end
  end

  def reduce_text doc
    doc.css('td > table:not([id]) tr').map { |row| row.text.strip.gsub(/\s{2,}/, ' ') }
  end

end

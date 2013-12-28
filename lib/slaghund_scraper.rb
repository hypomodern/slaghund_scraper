require "slaghund_scraper/version"
require "excon"
require 'nokogiri'

class SlaghundScraper
  attr_accessor :response, :csv

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

  def reduce doc
    doc.css('td > table:not([id]) tr').map { |row| clean_line row.text }
  end

  def clean_line line
    line
      .strip
      .gsub(/\s{2,}/, ' ')
      .gsub(/-->\s?/, '')
      .gsub(',', '.')
      .gsub(/(\(|\)|\/|%|")/, '')
      .squeeze(' ')
      .split(/\s(?=\d)/).join(",")
  end

  def scrape!
    reduce nokogirize fetch_data
  end

  def to_csv
    self.csv = scrape!.join("\r\n")
  end

end

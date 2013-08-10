require 'spec_helper'

describe SlaghundScraper do
  let(:scraper) { SlaghundScraper.new }

  describe "#fetch_data", vcr: { cassette_name: 'slaghund' } do
    it "requests data from SlaghundScraper::SLAGHUND" do
      Excon.should_receive(:get).with(SlaghundScraper::SLAGHUND)
      scraper.fetch_data
    end

    it "saves the response object to the @response ivar" do
      scraper.fetch_data
      scraper.response.should be_a_kind_of(Excon::Response)
    end
  end

  describe "#nokogirize", vcr: { cassette_name: 'slaghund' } do
    it "returns a Nokogiri document if the response is successful" do
      scraper.nokogirize( scraper.fetch_data ).should be_a_kind_of(Nokogiri::HTML::Document)
    end

    it "raises an exception otherwise" do
      -> { scraper.nokogirize(double(status: 501)) }.should raise_error
    end
  end

  describe "#reduce_text", vcr: { cassette_name: 'slaghund' } do
    it "returns an array of extracted strings" do
      result = scraper.reduce_text( scraper.nokogirize( scraper.fetch_data ) )
      result.should be_a_kind_of(Array)
      result.each { |line| line.should be_a_kind_of(String) }
    end
  end


end
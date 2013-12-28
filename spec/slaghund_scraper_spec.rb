require 'spec_helper'
require 'csv'

describe SlaghundScraper do
  let(:scraper) { SlaghundScraper.new }

  describe "#scrape!", vcr: { cassette_name: 'slaghund' } do
    it "returns an array of csv-formatted results, one row per ID" do
      results = scraper.scrape!
      results.should be_a_kind_of(Array)
    end
  end

  describe "#to_csv", vcr: { cassette_name: 'slaghund' } do
    it "returns a csv document" do
      doc = scraper.to_csv
      -> { CSV.parse doc }.should_not raise_error
    end
  end

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

  describe "#reduce", vcr: { cassette_name: 'slaghund' } do
    it "returns an array of extracted strings" do
      result = scraper.reduce( scraper.nokogirize( scraper.fetch_data ) )
      result.should be_a_kind_of(Array)
      result.each { |line| line.should be_a_kind_of(String) }
    end
  end

  describe "#clean_line", vcr: { cassette_name: 'slaghund' } do
    let(:reina) { "\r\n--> Reina Roja\r\n 33 / 32\r\n (50,77%)\r\n 5,2 14,6 14\r\n29" }
    subject { scraper.clean_line(reina) }

    it "formats the output as csv" do
      expect( subject ).to eq 'Reina Roja,33,32,50.77,5.2,14.6,14,29'
    end
  end

end
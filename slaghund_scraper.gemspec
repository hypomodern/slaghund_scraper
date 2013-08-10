# -*- encoding: utf-8 -*-
require File.expand_path('../lib/slaghund_scraper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matt Wilson"]
  gem.email         = ["mhw@hypomodern.com"]
  gem.description   = %q{Slaghund OCTGN stats scraper}
  gem.summary       = %q{Slaghund OCTGN stats scraper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "slaghund_scraper"
  gem.require_paths = ["lib"]
  gem.version       = SlaghundScraper::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'guard-rspec'
  gem.add_dependency 'excon'
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'rake'
end

# SlaghundScraper

[Slaghund](http://84.205.248.92/slaghund/slagview.aspx) is a nifty little utility that tracks
[Android: Netrunner](http://www.fantasyflightgames.com/edge_minisite.asp?eidm=207&enmi=Android:%20Netrunner%20The%20Card%20Game) [OCTGN](http://octgn.gamersjudgement.com/wordpress/anr/) result data. This here is a scraper that will give you CSV.

You can check out the ANR OCTGN plugin on [github](https://github.com/db0/Android-Netrunner-OCTGN)!

## Installation

Add this line to your application's Gemfile:

    gem 'slaghund_scraper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slaghund_scraper

## Usage / API

The scraper is really pretty simple. To get results as an array:

```ruby
data = SlaghundScraper.new.scrape!
```

Or you can go straight-to-csv:

```ruby
csv = SlaghundScraper.new.to_csv
```

Here's what the CSV looks like:

```csv
Jinteki,15063,17653,46.04,3.0,13.0,15,35
Personal Evolution,11217,11854,48.62,2.9,12.5,14,34
Replicating Perfection,3846,5799,39.88,3.3,14.3,16,36
Haas-Bioroid,22010,23345,48.53,4.8,13.4,15,34
Engineering the Future,18031,16812,51.75,5.0,13.3,15,34
Stronger Together,966,1998,32.59,3.5,12.2,16,36
Engineered for Success,577,983,36.99,3.4,21.7,16,33
Guarding the Net,1553,2527,38.06,4.4,10.7,14,32
Infinite Frontiers,883,1025,46.28,4.4,14.8,15,29
Weyland Consortium,16700,15913,51.21,3.5,13.7,14,32
Building a Better World,14627,12356,54.21,3.6,13.6,14,32
Because We Built It,2073,3557,36.82,3.1,14.3,15,34
NBN,19840,19475,50.46,4.3,13.5,15,32
Making News,15783,15860,49.88,4.2,13.9,15,34
The World Is Yours,4057,3615,52.88,4.4,11.7,13,25
Anarch,21428,21373,50.06,5.2,13.6,14,32
Noise,15251,14663,50.98,5.3,13.2,14,32
Whizzard,6144,6678,47.92,5.0,14.5,15,31
Reina Roja,33,32,50.77,5.2,14.6,14,29
Shaper,27398,31349,46.64,5.1,12.6,15,34
Kate McCaffrey,13916,15617,47.12,5.0,13.0,15,36
Chaos Theory,7922,9543,45.36,5.0,14.3,15,31
Exile,1119,1333,45.64,5.0,14.5,15,33
Rielle Kit Peddler,3490,3674,48.72,5.4,9.5,15,31
The Professor,766,1072,41.68,4.8,1.0,15,31
The Collective,185,110,62.71,5.5,4.9,14,31
Criminal,27560,20891,56.88,5.6,13.8,15,34
Gabriel Santiago,16173,13115,55.22,5.5,13.2,15,36
Andromeda,11258,7619,59.64,5.7,14.6,15,31
Laramy Fisk,129,157,45.10,5.0,14.4,13,26
```

The columns are:

`Name, Wins, Losses, Win Percentage, Average Agenda Points, Average Influence, Average Turns, Average Game Length`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

SlaghundScraper is provided under an MIT license. Have fun and enjoy. Best. Game. Evar.

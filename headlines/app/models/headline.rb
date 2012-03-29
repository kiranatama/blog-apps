class Headline
  include HTTParty
  base_uri 'http://api.espn.com/v1/sports'

  def self.all
    response = Headline.get('/news/headlines', :query => { :apikey => 'vwv6ka3d96abs7xru5xqzs35' })
    response["headlines"]
  end
end
class Headline
  include HTTParty
  base_uri 'http://api.espn.com/v1/sports'

  def self.all
    response = Headline.get('/news/headlines', :query => { :apikey => 'put-your-valid-apikey-here' })
    response["headlines"]
  end
end
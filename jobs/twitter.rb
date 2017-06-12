require 'twitter'
require 'dotenv'
Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = client.search("#auspol", :result_type => "recent").each.map do |tweet|
      { name: tweet.user.screen_name, body: tweet.text }
    end
    send_event('twitter_mentions', comments: tweets)
  rescue
  end
end
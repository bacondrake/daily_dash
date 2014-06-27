require 'nokogiri'
require 'open-uri'

the_time = Time.now.strftime "%H:%M"

SCHEDULER.every '10s' do
  send_event('welcome', { title: "Daily Dash", text: "The time is #{the_time}" })
end

reddit_frontpage = Nokogiri::HTML(open('http://www.reddit.com/r/todayilearned'))

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    front_page = reddit_frontpage.css('a.title')

    if front_page
      front_page = front_page.map do |heading|
        { body: heading.content }
      end
      send_event('reddit_frontpage', comments: front_page)
    end
  end
end
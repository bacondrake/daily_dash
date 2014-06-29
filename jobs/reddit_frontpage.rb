require 'nokogiri'
require 'open-uri'

reddit_frontpage = Nokogiri::HTML(open('http://www.reddit.com/r/todayilearned'))

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    headings = reddit_frontpage.css('a.title')

    if headings
      headings = headings.map do |heading|
        { body: heading.content }
      end
      send_event('reddit_frontpage', titles: headings)
    end
  end
end
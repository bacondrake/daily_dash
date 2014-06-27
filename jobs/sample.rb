the_time = Time.now.strftime "%H: %M"

SCHEDULER.every '60s' do
  send_event('welcome', { title: "Daily Dash", text: "The time is #{the_time}" })
end
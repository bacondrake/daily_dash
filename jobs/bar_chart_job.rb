# Note: change this to obtain your chart data from some external source
labels = ['September', 'December', 'March', 'June']
data = [
  {
    label: '2015-16 Financial Year',
    data: Array.new(labels.length) { rand(40..80) },
    backgroundColor: [ 'rgba(255, 99, 132, 0.2)' ] * labels.length,
    borderColor: [ 'rgba(255, 99, 132, 1)' ] * labels.length,
    borderWidth: 1,
  }, {
    label: '2016-17 Financial Year (projected)',
    data: Array.new(labels.length) { rand(40..80) },
    backgroundColor: [ 'rgba(255, 206, 86, 0.2)' ] * labels.length,
    borderColor: [ 'rgba(255, 206, 86, 1)' ] * labels.length,
    borderWidth: 1,
  }
]
options = { }

send_event('bar_chart', { labels: labels, datasets: data, options: options })
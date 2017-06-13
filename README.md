## Daily dashboard

A nice, simple, interactive dashboard made using the [dashing gem](http://shopify.github.com/dashing).

The [widgets](https://github.com/Shopify/dashing/wiki/Additional-Widgets) you can see on the [production page](http://daily-dash.herokuapp.com/sample) are:
* A greeting
* Weather forecast for the day done with [forecast.io](https://gist.github.com/mjamieson/5274790).
* [Heroku status](https://gist.github.com/bhankus/6828887).
* A [bar chart](https://github.com/jorgemorgado/dashing-barchart) displaying fake data that could be real!
* A [twitter feed](https://gist.github.com/jeroenbegyn/5419267). Mine is set to look at #auspol tweets. A lot of people angry about all sorts of stuff there.
* The front page of Reddit (no link for this one... I did it a long time ago and I can't find the documentation on the original. Still works, though!).
* Breaking [news from the BBC](https://gist.github.com/iainjmitchell/5271830).
* Obligatory [XKCD](https://gist.github.com/matt-snider/fd453f2c31a9d0131c52)

The app had fallen over at some point (app got scaled to 0 dynos), which gave me a chance to clean up code written 3 years ago and [redeploy to Heroku](http://daily-dash.herokuapp.com/sample).

### Note for myself in another 3 years
When in development mode run ```bundle exec dashing start``` to get the dashboard going.
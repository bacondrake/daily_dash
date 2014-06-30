class Dashing.Reddit_frontpage extends Dashing.Widget

  ready: ->
    @currentIndex = 0
    @titleElem = $(@node).find('.reddit')
    @nextComment()
    @startCarousel()

  onData: (data) ->
    @currentIndex = 0

  startCarousel: ->
    setInterval(@nextComment, 8000)

  nextComment: =>
    titles = @get('titles')
    if titles
      @titleElem.fadeOut =>
        @currentIndex = (@currentIndex + 1) % titles.length
        @set 'current_title', titles[@currentIndex]
        @titleElem.fadeIn()
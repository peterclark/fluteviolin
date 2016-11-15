Template.listen.events
  'click .music.button': (e) ->
    button  = $(e.target).closest('a.button')
    icon    = button.find('i.icon')
    music   = button.find('audio')[0]
    if music.paused
      audio.pause() for audio in $('audio').not($(music))
      music.play()
      icon.removeClass('play').addClass('pause')
    else
      music.pause()

  'ended audio': (e) ->
    icon = $(e.target).closest('.music.button').find('i.icon')
    icon.removeClass('pause').addClass('play')

  'pause audio': (e) ->
    button  = $(e.target).closest('a.button')
    icon    = button.find('i.icon')
    icon.removeClass('pause').addClass('play')

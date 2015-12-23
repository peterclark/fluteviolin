Template.listen.events
  'click .music.button': (e) ->
    console.log 'clicked'
    button  = $(e.target).closest('a.button')
    icon    = button.find('i.icon')
    music   = button.find('audio')[0]
    if music.paused
      music.play()
      icon.removeClass('play').addClass('pause')
    else
      music.pause()
      icon.removeClass('pause').addClass('play')

  'ended audio': (e) ->
    icon = $(e.target).closest('.music.button').find('i.icon')
    icon.removeClass('pause').addClass('play')

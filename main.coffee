if Meteor.isClient
  audio = {
    autumn: new Audio('/autumn.mp3')
    bouree: new Audio('/bouree.mp3')
    canon: new Audio('/canon.mp3')
    frivolity: new Audio('/frivolity.mp3')
  }

  Template.body.events
    'click .music.button': (e) ->
      button = $(e.target).closest('a.button')
      icon = button.find('i.icon')
      music = audio[ button.data('music') ]
      if music.paused
        music.play()
        icon.removeClass('play').addClass('pause')
      else
        music.pause()
        icon.removeClass('pause').addClass('play')

if Meteor.isServer
  Meteor.startup ->
    console.log 'this runs on the server'

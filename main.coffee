if Meteor.isClient

  Template.body.events
    'click .music.button': (e) ->
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

    'click #book-now': (e) ->
      $('#booking').modal('setting', 'transition', 'vertical flip').modal('show')

  Template.booking.rendered = ->
    $('.ui.dropdown').dropdown()
    $('.ui.checkbox').checkbox()
    $('.datetimepicker').datetimepicker
      format: 'MM/DD/YYYY'
      viewMode: 'years'
      useCurrent: false

if Meteor.isServer
  Meteor.startup ->
    console.log 'this runs on the server'

if Meteor.isClient
  Meteor.startup ->
    if Meteor.settings.public.env == 'development'
      Session.set('booking', Meteor.settings.public.booking)
    else
      Session.set('booking', new Booking)

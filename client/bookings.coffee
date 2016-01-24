Template.bookings.helpers

  created: ->
    moment(@createdAt).fromNow()

  mapLink: ->
    "http://maps.google.com/maps?q=san+antonio"

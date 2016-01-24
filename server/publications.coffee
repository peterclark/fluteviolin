Meteor.publish 'booking', (id) ->
  return Booking.find(_id: id)

Meteor.publish 'bookingsByPage', (skip=0) ->
  Booking.find({}, { sort: { createdAt: -1 }, limit: 10 , skip: skip })

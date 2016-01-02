Meteor.publish 'bookings', ->
  Booking.find()

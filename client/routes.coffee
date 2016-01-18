Router.route '/', ->
  @.render 'main'

Router.route '/bookings/:_id', ->
  @.render 'bookings',
    data: ->
      Booking.findOne( _id: @.params._id )

Router.route '/bookings', ->
  @.render '/bookingsIndex',
    data: ->
      Booking.find({}, { sort: { createdAt: -1 }, limit: 10 })

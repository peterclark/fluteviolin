Router.route '/', ->
  @.render 'main'

Router.route '/bookings/:_id', ->
  @.render 'bookings',
    data: ->
      Booking.findOne( _id: @.params._id )

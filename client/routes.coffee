Router.route '/', ->
  @.render 'main'

Router.route '/bookings', ->
  @.render 'bookings', data: -> Booking.find()

Router.route '/bookings/:_id', ->
  @.render 'bookings', data: -> Booking.findOne(_id: this.params._id)

Router.route '/', ->
  @.render 'main'

Router.route '/bookings',
  name: 'bookings-page',
  loadingTemplate: 'loading',
  waitOn: ->
    Meteor.subscribe('bookingsByPage', 0)
  ,
  data: ->
    Booking.find()
  ,
  action: ->
    @.render 'index'

Router.route '/bookings/:_id',
  name: 'booking',
  loadingTemplate: 'loading',
  waitOn: ->
    Meteor.subscribe('booking', @.params._id)
  ,
  data: ->
    Booking.findOne(_id: @.params._id)
  ,
  action: ->
    @.render 'bookings'

Router.route '/bookings/page/:page',
  name: 'booking-by-page',
  loadingTemplate: 'loading',
  waitOn: ->
    Meteor.subscribe('bookingsByPage', (+@.params.page)*10)
  ,
  data: ->
    Booking.find()
  ,
  action: ->
    @.render 'index'

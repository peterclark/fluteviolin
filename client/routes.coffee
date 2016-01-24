Router.route '/', ->
  @.render 'main'

Router.route '/bookings/:_id',
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
  loadingTemplate: 'loading',
  waitOn: ->
    Meteor.subscribe('bookingsByPage', (+@.params.page)*10)
  ,
  data: ->
    Booking.find()
  ,
  action: ->
    @.render 'index'

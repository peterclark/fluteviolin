Template.bookings.helpers
  total_cost: ->
    prices = (service.price for service in @services)
    prices.reduce (x,y) ->
      x+y
    , 0

  created: ->
    moment(@createdAt).fromNow()

Template.index.helpers

  created: ->
    moment(@createdAt).fromNow()

  mapLink: ->
    "http://maps.google.com/maps?q=san+antonio"

  bookings: ->
    Template.currentData()

  previousPage: ->
    (+Router.current().params.page || 1) - 1

  nextPage: ->
    (+Router.current().params.page || 1) + 1

  currentPage: ->
    (+Router.current().params.page || 1)

  disabled: (page) ->
    'disabled' if page==0

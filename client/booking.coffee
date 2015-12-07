Template.booking.rendered = ->
  $('.ui.dropdown').dropdown()
  $('.ui.checkbox').checkbox()
  $('.datepicker').pickadate
    min: +1
    max: +365
    disable: [
      [2016,2,5]
    ]

Template.booking.helpers
  services: ->
    MusicalService.all()

Template.booking.events
  'click #book-now': (e) ->
    e.preventDefault()
    $('.field.error').removeClass 'error'
    booking = new Booking
      full_name: $('#full_name').val()
      mobile: $('#mobile').val()
      event_date: $('#event_date').val()
      event_location: $('#event_location').val()
      services: $('#services').val()
      contract_accepted: $('#contract_accepted').val()

    if booking.isValid()
      Meteor.call "insertBooking", booking, (error, result) ->
    else
      fields = (Object.keys(field)[0] for field in booking.errors)
      inputs = (".#{field}" for field in fields)
      $(inputs.join(', ')).addClass 'error'
      console.log booking

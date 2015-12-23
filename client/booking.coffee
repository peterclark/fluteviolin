Template.booking.rendered = ->
  $('.ui.dropdown').dropdown()
  $('.ui.checkbox').checkbox()
  picker = new Pikaday
    field: $('#event_date')[0]
    minDate: moment().add(1, 'day').toDate()
    maxDate: moment().add(365, 'days').toDate()
    format: 'D MMMM, YYYY'

Template.booking.helpers
  services: ->
    MusicalService.all()

  booking: ->
    Meteor.settings.public.booking

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
      contract_accepted: $('#contract_accepted').is(':checked')

    if booking.isValid()
      $('#book-now').addClass 'loading'
      Meteor.call "insertBooking", booking, (error, result) ->
        if error
          console.log error.reason
        else
          setTimeout ->
            $('#book-now').removeClass('loading')
          , 2000
          console.log 'booking inserted'
    else
      fields = (Object.keys(field)[0] for field in booking.errors)
      inputs = (".#{field}" for field in fields)
      $(inputs.join(', ')).addClass 'error'
      console.log booking

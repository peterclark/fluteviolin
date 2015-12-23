Meteor.methods

  insertBooking: (params) ->

    services = MusicalService.find_by_ids( params.services )

    booking = new Booking
      full_name: params.full_name
      mobile: params.mobile
      event_date: params.event_date
      event_location: params.event_location
      services: services
      contract_accepted: params.contract_accepted

    if booking.insert()
      console.log booking
      twilio = Twilio(Meteor.settings.twilio.sid, Meteor.settings.twilio.token)
      twilio.sendSms
        to: booking.twilio_phone()
        from: Meteor.settings.twilio.from_mobile
        body: "Hi #{booking.full_name}, we received your request for Flute & Violin to play at your event on #{booking.event_date}. We'll contact you soon to confirm the date.\n ~ Leah & Ellen"
      , (err, response) ->
        if err
          console.log err
        else
          console.log "FROM: #{response.from}"
          console.log "BODY: #{response.body}"
    else
      console.log booking.errors
      throw new Meteor.Error("invalid-booking", "The booking is invalid")

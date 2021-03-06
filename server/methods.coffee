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

    booking.calculateFee()
    if booking.insert()
      Txt.sendBookingToCustomer( booking )
    else
      console.log booking.errors
      throw new Meteor.Error("invalid-booking", "The booking is invalid")

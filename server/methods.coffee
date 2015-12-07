Meteor.methods

  insertBooking: (params) ->

    customer = new Customer(params.customer)
    if customer.isInvalid()
      throw new Meteor.Error("invalid-customer", "Please provide full name & mobile number.")

    m_event = new MusicalEvent(params.musical_event)
    if m_event.isInvalid()
      throw new Meteor.Error("invalid-event", "Please provide event date & location.")

    services = MusicalService.find_by_ids( params.service_ids )

    booking = new Booking
      customer: customer
      event: m_event
      services: services
      accept_contract: params.accept_contract

    if booking.insert()
      console.log "Your booking was submitted"
    else
      throw new Meteor.Error("invalid-booking")

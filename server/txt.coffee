class @Txt

  SID = Meteor.settings.twilio.sid
  TOKEN = Meteor.settings.twilio.token
  NUMBER = Meteor.settings.twilio.from_mobile
  OWNER = Meteor.settings.twilio.owner_mobile
  ADMIN = Meteor.settings.twilio.admin_mobile

  @sendBookingToCustomer: (booking) ->
    twilio = Twilio( SID, TOKEN )
    twilio.sendSms
      to: booking.number()
      from: NUMBER
      body: "Hi #{booking.first_name()}, we received your request for Flute & Violin to play at your event. We'll contact you soon to confirm the date.\n ~ Leah & Ellen"
    , (err, response) ->
      if err
        console.log err
        Txt.sendErrorToAdmin( err, booking )
      else
        console.log "BODY: #{response.body}"
        Txt.sendBookingToOwner( booking )

  @sendBookingToOwner: (booking) ->
    twilio = Twilio( SID, TOKEN )
    twilio.sendSms
      to: OWNER
      from: NUMBER
      body: Meteor.settings.root_url + "/bookings/#{booking._id}"
    , (err, response) ->
      if err
        console.log err
      else
        console.log "BODY: #{response.body}"

  @sendErrorToAdmin: ( err, booking ) ->
    twilio = Twilio( SID, TOKEN )

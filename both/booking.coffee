class @Booking extends TinyModel

  @collection: new Meteor.Collection('bookings')

  @field 'contract_accepted', default: false

  @has an_embedded: 'customer', of_class: 'Customer'
  @has an_embedded: 'musical_event', of_class: 'MusicalEvent'
  @has many_embedded: 'musical_services', of_class: 'MusicalService'

  @validates 'contract_accepted', presence: true

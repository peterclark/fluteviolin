class @Booking extends TinyModel

  @collection: new Meteor.Collection('bookings')

  @field 'full_name', default: undefined
  @field 'mobile', default: undefined
  @field 'event_date', default: undefined
  @field 'event_location', default: undefined
  @field 'services', default: []
  @field 'contract_accepted', default: false

  @validates 'full_name', presence: true, length: { in: [5..30] }
  @validates 'mobile', presence: true, format: { with: /^(\d{10})$/ }
  @validates 'event_date', presence: true, format: { with: /^(\d{1,2}) (\w{3,9}), (\d{4})$/ }
  @validates 'event_location', presence: true, length: { in: [5..100] }
  @validates 'services', presence: true, length: { min: 1 }
  @validates 'contract_accepted', presence: true, inclusion: { in: [true] }

  first_name: ->
    @full_name.split(' ')[0] if @full_name

  last_name: ->
    @full_name.split(' ')[1] if @full_name

  number: ->
    "+1#{@mobile}"

  selected_services: ->
    (service.name for service in @services).join(', ')

  total_cost: ->
    prices = (service.price for service in @services)
    prices.reduce (x,y) ->
      x+y
    , 0

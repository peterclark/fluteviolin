class @MusicalService

  WEDDING = [
    { _id: 1, name: 'Prelude', price: 300.00 }
    { _id: 2, name: 'Marches', price: 300.00 }
    { _id: 3, name: 'Ceremony', price: 300.00 }
    { _id: 4, name: 'Prelude & Marches', price: 400.00 }
    { _id: 5, name: 'Prelude & Ceremony', price: 400.00 }
    { _id: 6, name: 'Marches & Ceremony', price: 400.00 }
    { _id: 7, name: 'Prelude, Marches & Ceremony', price: 450.00 }
  ]

  RECEPTION = [
    { _id: 8, name: '1 Hour Reception', price: 300.00 }
    { _id: 9, name: '2 Hour Reception', price: 500.00 }
    { _id: 10, name: '3 Hour Reception', price: 625.00 }
    { _id: 11, name: '4 Hour Reception', price: 775.00 }
  ]

  BOTH = [
    { _id: 12, name: 'Wedding Service & 1 Hour Reception', price: 600.00 }
    { _id: 13, name: 'Wedding Service & 2 Hour Reception', price: 750.00 }
    { _id: 14, name: 'Wedding Service & 3 Hour Reception', price: 850.00 }
  ]

  @wedding: ->
    WEDDING

  @reception: ->
    RECEPTION

  @both: ->
    BOTH

  @all: ->
    WEDDING.concat RECEPTION, BOTH

  @find_by_ids: (service_ids=[]) ->
    service_ids = (+id for id in service_ids)
    (service for service in MusicalService.all() when service._id in service_ids)

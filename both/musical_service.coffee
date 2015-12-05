class @MusicalService

  SERVICES = [
    { _id: 1, name: 'Prelude', price: 250.00 }
    { _id: 2, name: 'Marches', price: 250.00 }
    { _id: 3, name: 'Ceremony', price: 250.00 }
    { _id: 4, name: 'Prelude & Marches', price: 350.00 }
    { _id: 5, name: 'Prelude & Ceremony', price: 350.00 }
    { _id: 6, name: 'Marches & Ceremony', price: 350.00 }
    { _id: 7, name: 'Prelude, Marches & Ceremony', price: 400.00 }
    { _id: 8, name: '1 Hour Reception', price: 250.00 }
    { _id: 9, name: '2 Hour Reception', price: 450.00 }
    { _id: 10, name: '3 Hour Reception', price: 575.00 }
    { _id: 11, name: '4 Hour Reception', price: 700.00 }
    { _id: 12, name: 'Wedding Service & 1 Hour Reception', price: 550.00 }
    { _id: 13, name: 'Wedding Service & 2 Hour Reception', price: 700.00 }
    { _id: 14, name: 'Wedding Service & 3 Hour Reception', price: 800.00 }
  ]

  @all: ->
    SERVICES

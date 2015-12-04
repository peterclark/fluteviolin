Template.booking.rendered = ->
  $('.ui.dropdown').dropdown()
  $('.ui.checkbox').checkbox()
  $('.datepicker').pickadate
    min: +1
    max: +365
    disable: [
      [2016,2,5]
    ]

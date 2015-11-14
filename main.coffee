if Meteor.isClient
  Session.setDefault 'counter', 0

  Template.hello.helpers
    counter: -> Session.get 'counter'

  Template.hello.events
    'click .red.button': -> Session.set 'counter', Session.get('counter') + 1

if Meteor.isServer
  Meteor.startup ->
    console.log 'this runs on the server'

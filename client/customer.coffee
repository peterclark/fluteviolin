class @Customer extends TinyModel

  @field 'full_name', default: undefined
  @field 'mobile', default: undefined

  @validates 'full_name', presence: true, length: { in: [5..50] }
  @validates 'mobile', presence: true, format: { with: /^(\d{3})-(\d{3})-(\d{4})$/ }

  first_name: ->
    @full_name.split(' ')[0]

  last_name: ->
    @full_name.split(' ')[1]

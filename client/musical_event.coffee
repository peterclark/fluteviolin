class @MusicalEvent extends TinyModel

  @field 'date', default: undefined
  @field 'location', default: undefined

  @validates 'date', presence: true
  @validates 'location', presence: true, length: { in: [5..50] }

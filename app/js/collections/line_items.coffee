fsapp.collections.LineItems = Backbone.Collection.extend(
  model: fsapp.models.lineItem

  total: ->
    result = 0
    @each (item) ->
      result += item.get('value')
    result
)

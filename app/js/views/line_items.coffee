fsapp.views.LineItems = Backbone.View.extend(
  template: JST['app/templates/line_items.us']

  initialize: ->
    @subviews = []
    that = this
    @collection.each (item)->
      that.subviews.push(new fsapp.views.LineItem({model: item}))
    @listenTo @collection, "change", @updateTotal

  render: ->
    @$el.html(@template())
    that = this
    @$el.find('.line-items').html()
    _.each(@subviews, (item)->
      newstring = item.render()
      that.$el.find('.line-items').append(newstring)
    )
    @updateTotal()
    @el

  updateTotal: ->
    @$el.find('.total').html(@collection.total())
)

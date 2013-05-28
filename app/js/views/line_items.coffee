fsapp.views.LineItems = Backbone.View.extend(
	template: JST['app/templates/line_items.us']

	initialize: ->
		@subviews = []
		that = this
		@collection.each (item)->
			that.subviews.push(new fsapp.views.LineItem({model: item}))

	render: ->
		that = this
		_.each(@subviews, (item)->
			newstring = item.render()
			that.$el.append(newstring)
		)
		@el
)
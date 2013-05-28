fsapp.views.LineItem = Backbone.View.extend(

	template: JST['app/templates/line_item.us']
	tagName: 'div'

	events: 
		"change .money-input": "change"

	initialize: ->
		@listenTo @model, "change", @render

	change: ->
		@model.update @$el.find('.money-input').val()

	render: ->
		@$el.html(@template(@model.toJSON()))
		@el
)


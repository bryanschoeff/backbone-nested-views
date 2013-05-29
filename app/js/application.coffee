_.templateSettings = {
  interpolate : /\{\{\s*(.+?)\s*\}\}/g
}

window.fsapp =
  views: {}
  models: {}
  collections: {}
  templates: {}
  helpers: {}

$ ->
  initData = [
    new fsapp.models.LineItem({id: "CashForTheYear", value: 200000})
    ,
    new fsapp.models.LineItem({id: "DebtForTheYear", value: -1234567})
    ,
    new fsapp.models.LineItem({id: "Revenue", value: 12})
    ,
    new fsapp.models.LineItem({id: "Expenses", value: 0})
  ]


  fsapp.collections.lineItems = new fsapp.collections.LineItems(initData)
  fsapp.views.lineItems = new fsapp.views.LineItems({collection: fsapp.collections.lineItems})
  $('#list').html(fsapp.views.lineItems.render())

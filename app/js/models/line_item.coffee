fsapp.models.LineItem = Backbone.Model.extend(

  initialize: (obj)->
    @set "id", obj.id
    @update obj.value

  update: (val)->
    @set "value", @cleaned val
    @set "formatted", @formatted(@get 'value')

  cleaned: (val)->
    regex = /[(),]/ig
    result = parseInt(val.toString().replace(regex, ''),0)

    if (val.toString().match(/\((.+?)\)/))
      console.log('yo')
      result *= -1
    result

  formatted: (val)->
    result = @commatized Math.abs(val)
    if (val < 0.0)
      result = '(' + result + ')'
    result

  commatized: (val)->
    stringnum = val.toString()
    if (stringnum.length > 3)
      return @commatized(stringnum.substring(0, stringnum.length - 3)) + ',' + stringnum.substring(stringnum.length - 3, stringnum.length)
    else
      return stringnum
)

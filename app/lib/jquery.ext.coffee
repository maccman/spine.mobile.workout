$ = jQuery
  
$.fn.serializeForm = ->
  result = {}
  for item in $(@).serializeArray()
    result[item.name] = item.value
  result
  
$ ->
  $('body').bind 'orientationchange', (e) ->
    orientation = if Math.abs(window.orientation) is 90 then 'landscape' else 'portrait'
    $('body').removeClass('portrait landscape')
             .addClass(orientation)
             .trigger('turn', orientation: orientation)
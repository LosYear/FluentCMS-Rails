$(document).ready  ->
  $('a[confirm]').click ->
    return confirm($(this).attr('confirm'))

$(document).on 'page:done', ->
  $('a[confirm]').click ->
    return confirm($(this).attr('confirm'))
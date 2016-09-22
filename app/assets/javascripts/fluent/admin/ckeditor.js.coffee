$(document).ready ->
  $(document).on 'page:done', ->
    if typeof(CKEDITOR) != "undefined"
      $.each CKEDITOR.instances, (index, instance) ->
        if $('#'+instance.name).length > 0 && $('#'+instance.name).css('visibility') != 'hidden'
         CKEDITOR.replace(instance.name)
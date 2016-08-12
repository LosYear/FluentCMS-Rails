$(document).ready ->
  $(document).on 'page:done', ->
    $.each CKEDITOR.instances, (index, instance) ->
      if $('#'+instance.name).length > 0 && !instance
       CKEDITOR.replace(instance.name)
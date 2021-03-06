# Global functions referenced from HTML
@showWaiting = (element_id, text, centered) ->
  element = $(element_id)
  if element && centered
    element.html('<br /><div class=\"center\"><img width=\"13\" height=\"13\" src=\"' + root_url + 'assets/contour/ajax-loader.gif\" align=\"absmiddle\" alt=\"...\" />' + text + '</div><br />')
  else if element
    element.html('<img width=\"13\" height=\"13\" src=\"' + root_url + 'assets/contour/ajax-loader.gif\" align=\"absmiddle\" alt=\"...\" />' + text)

@flashMessage = (message, alert_type = 'success', overwrite = true) ->
  div_block = "<div class='navbar-alert alert alert-#{alert_type}'><button type='button' class='close' data-dismiss='alert'>×</button>#{message}</div>"
  flash_container = $('[data-object~="flash-container"]')
  if overwrite
    flash_container.html(div_block)
  else
    flash_container.append(div_block)

@nonStandardClick = (event) ->
  event.which > 1 or event.metaKey or event.ctrlKey or event.shiftKey or event.altKey

jQuery ->
  $(".timepicker").timepicker
    showMeridian: false
    showSeconds: true
    defaultTime: false
  $(".datepicker").datepicker('remove')
  $(".datepicker").datepicker( autoclose: true )

  $(document).on('change', '.datepicker', () ->
    try
      $(this).val($.datepicker.formatDate('mm/dd/yy', $.datepicker.parseDate('mm/dd/yy', $(this).val())))
    catch error
      # Nothing
  )

  $(document).on('click', ".pagination a, .page a, .next a, .prev a", () ->
    return false if $(this).parent().is('.active, .disabled, .per_page')
    $.get(this.href, null, null, "script")
    false
  )

  $(document).on("click", ".per_page a", () ->
    object_class = $(this).data('object')
    $.get($("#"+object_class+"_search").attr("action"), $("#"+object_class+"_search").serialize() + "&"+object_class+"_per_page="+ $(this).data('count'), null, "script")
    false
  )

  $(document).on('click', '[data-object~="order"]', () ->
    $('#order').val($(this).data('order'))
    $($(this).data('form')).submit()
    false
  )

  # Load forms on page load
  $('[data-object~="form-load"]').submit()

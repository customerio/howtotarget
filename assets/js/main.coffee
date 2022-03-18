$(document).ready ->
  # Check for empty state
  emptyStateChecker = () ->
    setInterval (->
      if $('.hack').is(':visible')
        $('.hacks__empty').hide()
      else
        $('.hacks__empty').fadeIn()
        $('.hacks__empty').css('display', 'flex')
    ), 250

  # Deprecated hacks toggle
  $('.controls__deprecated input').click ->
    deprecatedHack = $('.hack__status--deprecated').closest('.hack')

    if $(this).is(':checked')
      deprecatedHack.slideDown()
    else
      deprecatedHack.slideUp()

    emptyStateChecker()

  # Input filter
  $('#filter-input').bind 'keyup change input focus blur', (e) ->
    emptyStateChecker()

    valThis = $(this).val().toLowerCase()

    if valThis == ''
      $('.controls__deprecated').removeClass('disabled')
    else
      $('.controls__deprecated').addClass('disabled')

    $('.hack__client').each ->
      text = $(this).text().toLowerCase()
      if text.indexOf(valThis) == 0
        $(this).closest('.hack').not('.hack--deprecated').slideDown()
      else
        $(this).closest('.hack').slideUp()

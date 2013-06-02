$ ->
  $('#tabs').tabs()
  $('a#toggle-watsi').bind 'click', (e) ->
    $('.shit').show('slow')
    $('html, body').animate({scrollTop:660},'50');
    e.preventDefault()

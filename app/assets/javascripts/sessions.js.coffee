$ ->

  $('#fb_link').on 'click', ->
    if window.location.hostname != 'lvh.me'
      alert 'this fb key uses lvh.me instead of localhost in development'
      window.location.replace('http://lvh.me:3000/auth/facebook')
      return false

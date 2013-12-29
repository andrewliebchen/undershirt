$ ->
  HEADER = $('.header-main')

  $('.scrolling-header').scrollToFixed(
    preFixed: ->
      headerHeight = HEADER.height()
      scrollingHeaderHeight = $('.scrolling-header').height()
      headerPosition = headerHeight - scrollingHeaderHeight
      HEADER.css(
        "position": "fixed",
        "top": "-#{headerPosition}px"
      )
      $('.nav-main').clone().appendTo('.scrolling-header')
    postFixed: ->
      HEADER.css(
        'position':  'relative',
        'top': '0px'
      )
      $('.scrolling-header .nav-main').remove()
  )

  $(document).on 'click', '[data-toggle]', (event) ->
    target = $($(@).data('toggle'))
    event.preventDefault()
    target.toggle()


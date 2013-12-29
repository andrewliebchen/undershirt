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
      $('.section-main').css "margin-top", "#{headerPosition}px"
    postFixed: ->
      HEADER.css(
        'position':  'relative',
        'top': '0px'
      )
      $('.scrolling-header .nav-main').remove()
      $('.section-main').css "margin-top", "0"
  )

  $(document).on 'click', '[data-toggle]', (event) ->
    target = $($(@).data('toggle'))
    event.preventDefault()
    target.toggle()


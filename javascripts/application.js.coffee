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
      ).addClass('is-scrolling')
      $('.nav-main').clone().appendTo('.scrolling-header')
      $('.section-main').css "margin-top", "#{headerPosition + 30}px"
    postFixed: ->
      HEADER.css(
        'position':  'relative',
        'top': '0px'
      ).removeClass('is-scrolling')
      $('.scrolling-header .nav-main').remove()
      $('.section-main').css "margin-top", "0"
  )

  $(document).on 'click', '[data-toggle]', (event) ->
    target = $($(@).data('toggle'))
    event.preventDefault()
    target.toggle()

  $(document).on 'mouseenter', '[data-title]', (event) ->
    titleText = $(@).data('title')
    event.preventDefault()
    $(@).append("<span class='tooltip'>#{titleText}</span>")

  $(document).on 'mouseleave', '[data-title]', (event) ->
    event.preventDefault()
    $(@).find('.tooltip').remove()

  $(window).scroll ->
    scrollPosition = $(window).scrollTop()
    parallaxYPos = scrollPosition * 0.08
    HEADER.find('hgroup').css 'top', "#{parallaxYPos}%"



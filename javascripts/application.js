(function() {
  $(function() {
    var HEADER;
    HEADER = $('.header-main');
    $('.scrolling-header').scrollToFixed({
      preFixed: function() {
        var headerHeight, headerPosition, scrollingHeaderHeight;
        headerHeight = HEADER.height();
        scrollingHeaderHeight = $('.scrolling-header').height();
        headerPosition = headerHeight - scrollingHeaderHeight;
        HEADER.css({
          "position": "fixed",
          "top": "-" + headerPosition + "px"
        }).addClass('is-scrolling');
        $('.nav-main').clone().appendTo('.scrolling-header');
        return $('.section-main').css("margin-top", "" + (headerPosition + 30) + "px");
      },
      postFixed: function() {
        HEADER.css({
          'position': 'relative',
          'top': '0px'
        }).removeClass('is-scrolling');
        $('.scrolling-header .nav-main').remove();
        return $('.section-main').css("margin-top", "0");
      }
    });
    $(document).on('click', '[data-toggle]', function(event) {
      var target;
      target = $($(this).data('toggle'));
      event.preventDefault();
      return target.toggle();
    });
    $(document).on('mouseenter', '[data-title]', function(event) {
      var titleText;
      titleText = $(this).data('title');
      event.preventDefault();
      return $(this).append("<span class='tooltip'>" + titleText + "</span>");
    });
    $(document).on('mouseleave', '[data-title]', function(event) {
      event.preventDefault();
      return $(this).find('.tooltip').remove();
    });
    return $(window).scroll(function() {
      var parallaxYPos, scrollPosition;
      scrollPosition = $(window).scrollTop();
      parallaxYPos = scrollPosition * 0.08;
      return HEADER.find('hgroup').css('top', "" + parallaxYPos + "%");
    });
  });

}).call(this);

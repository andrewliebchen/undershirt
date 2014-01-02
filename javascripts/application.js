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
        });
        $('.nav-main').clone().appendTo('.scrolling-header');
        return $('.section-main').css("margin-top", "" + headerPosition + "px");
      },
      postFixed: function() {
        HEADER.css({
          'position': 'relative',
          'top': '0px'
        });
        $('.scrolling-header .nav-main').remove();
        return $('.section-main').css("margin-top", "0");
      }
    });
    return $(document).on('click', '[data-toggle]', function(event) {
      var target;
      target = $($(this).data('toggle'));
      event.preventDefault();
      return target.toggle();
    });
  });

}).call(this);

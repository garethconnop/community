jQuery(document).ready(function($) {

  // Fittext
  $(".hero h1").fitText(0.8, { minFontSize: '36px', maxFontSize: '80px' });
  $(".headline").fitText(2, { minFontSize: '20px', maxFontSize: '30px' });

  //////////////////////////////////////////////////////////////////////////



  // Responsive Navigation

  $(".navicon-button").click(function() {
    $(this).toggleClass("open");
    $(".navicon").toggleClass("close");
    $("header nav").toggleClass("nav-expanded");
    $("header").toggleClass("header-fill");
  });

  //////////////////////////////////////////////////////////////////////////



  // User Navigation Dropdown

  $('.clicker').click(function(e) {
    $('nav span .dropdown').slideToggle(0);
    $('.clicker').toggleClass('open');
  });

  $(document).click(function() {
    if (!$(event.target).closest('header').length) {
    $('nav span .dropdown', this).slideUp(0);
    $('.clicker').removeClass('open');
    }
  });

  //////////////////////////////////////////////////////////////////////////

});



// Fittext Responsive Text is applied from the document ready function

(function( $ ){

  $.fn.fitText = function( kompressor, options ) {

    // Setup options
    var compressor = kompressor || 1,
      settings = $.extend({
        'minFontSize' : Number.NEGATIVE_INFINITY,
        'maxFontSize' : Number.POSITIVE_INFINITY
      }, options);

    return this.each(function(){

      // Store the object
      var $this = $(this);

      // Resizer() resizes items based on the object width divided by the compressor * 10
      var resizer = function () {
        $this.css('font-size', Math.max(Math.min($this.width() / (compressor*10), parseFloat(settings.maxFontSize)), parseFloat(settings.minFontSize)));
      };

      // Call once to set.
      resizer();

      // Call on resize. Opera debounces their resize by default.
      $(window).on('resize.fittext orientationchange.fittext', resizer);

    });

  };

})( jQuery );

//////////////////////////////////////////////////////////////////////////
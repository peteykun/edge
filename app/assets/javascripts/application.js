// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require lazybox
//= require_tree .

function set_mobile_toggle() {
  $('#mobile_menu_toggle').on('click', function() {
    $('#mobile_menu').toggle();
  });
}

function highlight() {
  $('.featured_event_button').animate({opacity: 1}, 2000, dim);
}

function dim() {
  $('.featured_event_button').animate({opacity: 0.65}, 2000, highlight);
}

function bind_buttons() {
  $('.category_button').on('click', function() {
    if($('.sidebar_category[data-id="' + $(this).data('id') + '"]').is(":visible"))
      $('.sidebar_category').slideUp(400);
    else
    {
      $('.sidebar_category').slideUp(400);
      $('.sidebar_category[data-id="' + $(this).data('id') + '"]').slideDown(400);
    }
  });
}

$(document).ready(function() {

  $('a[rel*=lazybox]').lazybox({close: false, modal: false, opacity: 0.7, klass: 'lazybox', speed: 200, fixed: true});

  $('.featured_event_button').animate({opacity: 1}, 1000, function() {
    $('.featured_event_button').animate({opacity: 0.65}, 1000, function() {
      $('.featured_event_button').animate({opacity: 1}, 1000, function() {
        $('.featured_event_button').animate({opacity: 0.65}, 1000, function() {
          $('.featured_event_button').animate({opacity: 1}, 1000, function() {
            $('.featured_event_button').animate({opacity: "0.85"}, 2000, function() {
              $('.featured_event_button').css('opacity', '');
            });
          });
        });
      });
    });
  });
});

$(document).ready(bind_buttons);
$(document).on('page:load', bind_buttons);

$(document).ready(set_mobile_toggle);
$(document).on('page:load', set_mobile_toggle);

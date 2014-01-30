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

function highlight() {
  $('.fa-stockit').animate({opacity: 1}, 2000, dim);
}

function dim() {
  $('.fa-stockit').animate({opacity: 0.65}, 2000, highlight);
}

$(document).ready(function() {
  $('a[rel*=lazybox]').lazybox({close: false, modal: false, opacity: 0.7, klass: 'lazybox', speed: 200, fixed: true});

  $('.fa-stockit').animate({opacity: 1}, 1000, function() {
    $('.fa-stockit').animate({opacity: 0.65}, 1000, function() {
      $('.fa-stockit').animate({opacity: 1}, 1000, function() {
        $('.fa-stockit').animate({opacity: 0.65}, 1000, function() {
          $('.fa-stockit').animate({opacity: 1}, 1000, function() {
            $('.fa-stockit').animate({opacity: "0.85"}, 2000, function() {
              $('.fa-stockit').css('opacity', '');
            });
          });
        });
      });
    });
  });
});

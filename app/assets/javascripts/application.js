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

$(document).ready(function() {
  $('a[rel*=lazybox]').lazybox({close: false, modal: false, opacity: 0.7, klass: 'lazybox', speed: 200, fixed: true});
});

$(document).ready(function() {
	var links = $('#sidebar').find('a');

	for(var i = 0; i < links.length; i++) {
		links[i].onclick = function() {
			var href = this.href;
			$('li.active').removeClass('active');
			$(this).parent().addClass('active');

			$.get(href, function(response) {
				window.response_html = response;
				$('#container').html($(response).filter('#container').html());

				if(href.indexOf('contacts') != -1)
					refresh_active_contact();
			});

			window.history.pushState({}, document.title, href.substring(href.indexOf(window.location.origin) + window.location.origin.length));
			this.blur();

			return false;
		}
	}
});
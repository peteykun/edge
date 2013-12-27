# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  help = ->
    $('.contacts').hide() ;
    $('#cc_' + $('#contact_categories option:selected').val() ).show() ;

  window.onload = help
  $('#contact_categories').change help

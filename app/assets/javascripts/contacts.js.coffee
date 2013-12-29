# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@refresh_active_contact = ->
  return if $('.contacts').length is 1

  $('.contacts').hide() ;
  $('#cc_' + $('#message_contact_category_id option:selected').val() ).show() ;

jQuery ->
  window.onload = refresh_active_contact
  $('#container').on({change: refresh_active_contact}, "#message_contact_category_id")

$(function() {
  var end_date = new Date("April 04, 2014 09:30:00");

  var timerId = countdown (
    end_date,

    function(ts) {
      if(end_date <= new Date())
      {
        $('#countdown').fadeOut();
        window.clearInterval(timerId);
      }

      else
        $('#countdown b').html(ts.toHTML("span"));
    },

    countdown.MONTHS|countdown.DAYS|countdown.HOURS|countdown.MINUTES|countdown.SECONDS
  );

  if(end_date > new Date())
    $('#countdown').fadeIn();
});
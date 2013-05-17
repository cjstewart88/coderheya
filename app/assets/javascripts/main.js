$(document).ready(function () {
  $('.tooltip').tipsy();

  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
});
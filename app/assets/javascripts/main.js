$(document).ready(function () {
  $('.tooltip').tipsy();
  
  $('#about-dialog').dialog({
    modal: true,
    autoOpen: false,
    width: 600,
    draggable: false,
    title: 'About'
  });
  $('#about-toggle').click(function () { $('#about-dialog').dialog('open'); });
});
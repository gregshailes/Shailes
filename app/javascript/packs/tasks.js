window.onbeforeunload = function (event) {
  var message = 'Important: Please click on \'Save\' button to leave this page.';
  if (typeof event == 'undefined') {
    event = window.event;
  }
  if (event) {
    event.returnValue = message;
  }
  return message;
};

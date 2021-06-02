document.addEventListener("turbolinks:load", function() {
  $google = $('.googleSearch');
  $form = $('form#f');
  $body = $('body');

  if($google.length > 0) {
    $google.focus();

    $form.on('submit', function(event) {
      event.preventDefault();
      event.currentTarget.submit();
      focusOnSearch();
    });

    $('nav a').on('click', function(event) {
      $(event.currentTarget).blur();
      focusOnSearch();
    });
  }
});

function focusOnSearch() {
  $google.trigger('click');
  $google.focus();
  $google.val('');
}

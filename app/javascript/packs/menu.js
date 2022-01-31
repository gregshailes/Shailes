document.addEventListener("turbolinks:load", function() {
  $menu_button     = $('a.show-menu');
  $menu            = $('nav.menu')

  $menu_button.on('click', showMenu);

});

function showMenu() {
  if($menu.hasClass('show')) {
    $menu.addClass('show');
  } else {
    $menu.removeClass('show');
  }
}

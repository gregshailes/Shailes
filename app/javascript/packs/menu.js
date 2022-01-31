document.addEventListener("turbolinks:load", function() {
  $menu_button     = $('a.show-menu');
  $menu            = $('nav.menu')

  $menu_button.on('click', showMenu);

});

function showMenu(e) {
  e.preventDefault();
  e.stopPropagation();
  if($menu.hasClass('show')) {
    $menu.removeClass('show');
  } else {
    $menu.addClass('show');
  }
}

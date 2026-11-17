// Responsive menu header
const phone_nav_button = document.querySelector('#phone_nav_button');
const ul_main_nav = document.querySelector('nav ul');
const menu_icons = document.querySelectorAll('#phone_nav_button span');
    // Listen click to open / close menu on phone
phone_nav_button.addEventListener('click', ()=> {
    ul_main_nav.style.display === 'none' || ul_main_nav.style.display === '' ? ul_main_nav.style.display = 'flex' : ul_main_nav.style.display = 'none';

    // What is the menu icon's expantion status before the click ?
    let is_open = false;
    if (phone_nav_button.getAttribute('aria-expanded') == "true") {
        is_open =true;
    }

    // Changing expantion status to the current one
    phone_nav_button.setAttribute('aria-expanded', is_open ? 'false' : 'true');

    ul_main_nav.classList.toggle('is_expanded', !is_open);

    // Toggle menu icon animation
    for (let menu_icon of menu_icons) {
        menu_icon.classList.toggle('menu_icon_animation', !is_open);
    }
})
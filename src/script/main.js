// Responsive menu header
const phone_nav_button = document.querySelector('#phone_nav_button');
const ul_main_nav = document.querySelector('nav ul');
const menu_icons = document.querySelectorAll('#phone_nav_button div');
    // Listen click to open / close menu on phone
phone_nav_button.addEventListener('click', ()=> {
    ul_main_nav.style.display === 'none' || ul_main_nav.style.display === '' ? ul_main_nav.style.display = 'block' : ul_main_nav.style.display = 'none';
    // Toggle menu icon animation
    for (menu_icon of menu_icons) {
        menu_icon.classList.toggle('change');
    }
})

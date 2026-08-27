// Clearing localStorage when opening the website
//////// Futur : Style saving connection data
    // Retrieving the last url's begining
let last_url_string =""
for (i=0 ; i<16 ; i++) {
    last_url_string += document.referrer[i];
}
    // If last url's begining doesn't match websiteurl's begining => rest localStorage
if (last_url_string !== "http://127.0.0.1") {
    //////// Default filters values
    localStorage.setItem('chosed_collection', 'all_collections');
    localStorage.setItem('is_exposed', 'false');
    localStorage.setItem('continent', 'none_continent');
    localStorage.setItem('search_country', '');
}


// Responsive menu header
const phone_nav_button = document.querySelector('#phone_nav_button');
const ul_main_nav = document.querySelector('nav ul');
const menu_icons = document.querySelectorAll('#phone_nav_button div');
    // Listen click to open / close menu on phone
phone_nav_button.addEventListener('click', ()=> {
    ul_main_nav.style.display === 'none' || ul_main_nav.style.display === '' ? ul_main_nav.style.display = 'flex' : ul_main_nav.style.display = 'none';
    // Toggle menu icon animation
    for (menu_icon of menu_icons) {
        menu_icon.classList.toggle('menu_icon_animation');
    }
})
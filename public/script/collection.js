//////// Filters
const submit_filters_button = document.querySelector('#submit_filters_button');
const is_exposed = document.querySelector('#is_exposed');
const continent = document.querySelector('#continent');
const chosed_collection = document.querySelector('#collection');
const search_country = document.querySelector('#search_country');
const form_filters = document.querySelector('#searchbar_filters form');

// If filters were applied retrieve them in filter
if (localStorage.getItem('is_exposed') === 'true') {
    is_exposed.checked = true;
}
if (localStorage.getItem('continent') !== null) {
    continent.value = localStorage.getItem('continent');
}
if (localStorage.getItem('collection') !== null) {
    chosed_collection.value = localStorage.getItem('collection');
}
if (localStorage.getItem('search_country') !== null) {
    search_country.value = localStorage.getItem('search_country');
}

// Listen click on filter saving button
submit_filters_button.addEventListener('click', ()=> {
    // Save in localStorage all filters
    localStorage.setItem('is_exposed', is_exposed.checked);

    localStorage.setItem('continent', continent.value);

    if (localStorage.getItem('collection') != null) {
        localStorage.setItem('collection', chosed_collection.value);
    } else {
        localStorage.setItem('collection', "");
    }

    localStorage.setItem('search_country', search_country.value);
})
//////// Function changing collection.html's title in tab and breadcrumbs
function changing_tab_breadcrumbs() {
    const tab_title = document.querySelector('head title');
    const page_breadcrumb_title = document.querySelector('.breadcrumbs li:last-child');

    // localStorage value for 'chosed_collection'
    const saved_collections = localStorage.getItem('chosed_collection');
    switch (saved_collections) {
        case "vertebrate" :
            tab_title.innerText = (`Vertébrés - Paléo Curios`);
            page_breadcrumb_title.innerText = ('Vertébrés');
            break
        case "invertebrate" :
            tab_title.innerText = (`Invertébrés - Paléo Curios`);
            page_breadcrumb_title.innerText = ('Invertébrés');
            break
        case "insect" :
            tab_title.innerText = (`Insectes - Paléo Curios`);
            page_breadcrumb_title.innerText = ('Insectes');
            break
        case "plant" :
            tab_title.innerText = (`Plantes - Paléo Curios`);
            page_breadcrumb_title.innerText = ('Plantes');
            break
        case "other_fossils" :
            tab_title.innerText = (`Autres - Paléo Curios`);
            page_breadcrumb_title.innerText = ('Autres');
            break
    }
}
// Changing tab and breadcrumb's page title on opening
changing_tab_breadcrumbs();

//////// Filters
const submit_filters_button = document.querySelector('#submit_filters_button');
const is_exposed = document.querySelector('#is_exposed');
const continent = document.querySelector('#continent');
const chosed_collection = document.querySelector('#select_collection');
const search_country = document.querySelector('#search_country');
const form_filters = document.querySelector('#searchbar_filters form');

// If filters was applied retrieve them in filter
if (localStorage.getItem('is_exposed') === 'true') {
    is_exposed.checked = true;
}
if (localStorage.getItem('continent') !== null) {
    continent.value = localStorage.getItem('continent');
}
if (localStorage.getItem('chosed_collection') !== null) {
    chosed_collection.value = localStorage.getItem('chosed_collection');
}
if (localStorage.getItem('search_country') !== null) {
    search_country.value = localStorage.getItem('search_country');
}

// Listen click on filter saving button
submit_filters_button.addEventListener('click', ()=> {
    // Save in localStorage all filters
    localStorage.setItem('is_exposed', is_exposed.checked);
    localStorage.setItem('continent', continent.value);
    localStorage.setItem('chosed_collection', select_collection.value);
    localStorage.setItem('search_country', search_country.value);
    // Refresh tab and breadcrumb's page title
    changing_tab_breadcrumbs();
})

//////// Pseudo fossils' database in js
/*
Array of objects :
fossil {
id: ,
name: ,
species: null {name: , link: },
collection: ,
description: ,
is_exposed: ,
fossil_type: ,
dating: ,
continent: ,
extraction_site: ,
researchable: bool,
owner: null {name: , email: },
number_click: 
}
*/

import { fossils_db } from "./fossils_db.js";
for (const fossil of fossils_db) {
    if (localStorage.getItem('chosed_collections') !== "all_collections" && localStorage.getItem('chosed_collections') === fossil["collection"]) {

        console.log(fossil["name"]);
    }
}
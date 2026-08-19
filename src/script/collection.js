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
published_date: , => ISO format
name: , => name in owner's collection
species: null {name: , link: null}, => if not null then name and wikipedia link if it exist
collection: , => all_collections ; vertebrate ; invertebrate ; insect ; plant ; other_fossils
description: ,
is_exposed: null, => null or museum name
fossil_type: ,
dating: , => number and noted in Ma (=million years ago)
continent: , => none_continent ; africa ; north_america ; south_america ; antartica ; asia ; europa ; oceania
extraction_site: ,
researchable: bool, => if true then owner !== nul
owner: null {name: , email: },
number_click: 
}
*/

import { fossils_db } from "./fossils_db.js";
const filtered_fossils = [];

//  Vertebres > invertebres > plantes > autres > insectes
// europe > amrc nord > asie > afrique > amrc sud > oceanie > antartique=0
// 74 is_exposed

// If fossil is exposed
if (localStorage.getItem('is_exposed') === "true") {
    // fossils_db can't be sorted before then
    for (const fossil of fossils_db) {
        if (fossil["is_exposed"] != null) {
            filtered_fossils.push(fossil);
        }
    }
}

// If a continent was chosed
if (localStorage.getItem('continent') !== "none_continent") {
    // Does fossils_db has already been sorted ?
    if (filtered_fossils.length !== 0) {
        for (let i=0 ; i < filtered_fossils.length ; i++) {
            console.log(filtered_fossils[i]);
            if (filtered_fossils[i]["continent"] != localStorage.getItem('continent')) {
                filtered_fossils.splice(i, 1);
                i--;
            }
        }
    } else {
        // fossils_db hasn't been sorted before then
        for (const fossil of fossils_db) {
            if (localStorage.getItem('continent') === fossil["continent"]) {
                filtered_fossils.push(fossil);
            }
        }
    }
}

// If a collection was chosed
if (localStorage.getItem('chosed_collection') !== "all_collections") {
    // Does fossils_db has already been sorted ?
    if (filtered_fossils.length !== 0) {
        for (let i=0 ; i < filtered_fossils.length ; i++) {
            console.log(filtered_fossils[i]);
            if (filtered_fossils[i]["collection"] != localStorage.getItem('chosed_collection')) {
                filtered_fossils.splice(i, 1);
                i--;
            }
        }
    } else {
        // fossils_db hasn't been sorted before then
        for (const fossil of fossils_db) {
            if (localStorage.getItem('chosed_collection') === fossil["collection"]) {
                filtered_fossils.push(fossil);
            }
        }
    }
}
console.log(filtered_fossils);

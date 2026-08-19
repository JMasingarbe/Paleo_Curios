//////// Function changing collection.html's title in tab and breadcrumbs
function changing_tab_breadcrumbs() {
    const tab_title = document.querySelector('head title');
    const page_breadcrumb_title = document.querySelector('.breadcrumbs li:last-child');

    // localStorage value for 'chosed_collection'
    const saved_collections = localStorage.getItem('chosed_collection');
    // Change tab and breadcrumb 's title depending on chosed collection
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
const chosed_collection = document.querySelector('#chosed_collection');
const search_country = document.querySelector('#search_country');
const form_filters = document.querySelector('#searchbar_filters form');

// If filters were applied retrieve them in filter
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
    localStorage.setItem('chosed_collection', chosed_collection.value);
    localStorage.setItem('search_country', search_country.value);
    // Refresh tab and breadcrumb's page title
    changing_tab_breadcrumbs();
})

//////// Pseudo fossils' database in js
/*
Array of objects :
fossil {
id: ,
published_date: ,                       => ISO format
name: ,                                 => name in owner's collection
species: null {name: , link: null},     => if not null then name and wikipedia link if it exist
collection: ,                           => all_collections ; vertebrate ; invertebrate ; insect ; plant ; other_fossils
description: ,
is_exposed: null,                       => null or museum name
fossil_type: ,
dating: ,                               => number and noted in Ma (=million years ago)
continent: ,                            => none_continent ; africa ; north_america ; south_america ; antartica ; asia ; europa ; oceania
extraction_site: ,
researchable: bool,                     => if true then owner !== nul
owner: null {name: , email: },
number_click: 
}
*/

// Importing pseudo fossils db
import { fossils_db } from "./fossils_db.js";

// Array stocking filtered fossils
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


//////// Changing fossil's card name depending if there's filters
// Elements containing fossil's name of all cards
const fossils_cards = document.querySelectorAll('#collection_fossils a');
const fossils_cards_name = document.querySelectorAll('#collection_fossils a article h3');
const fossils_cards_dating = document.querySelectorAll('#collection_fossils a article p');
const fossils_notfound = document.querySelector('#collection_fossils h1');

// If there's filter then use filtered fossils datas else use all database
if (filtered_fossils.length > 0) {
    // Finding if filtered is smaller than the number of cards
    let smallest_length = 0;
    filtered_fossils.length > fossils_cards_name.length ? smallest_length = fossils_cards_name.length : smallest_length = filtered_fossils.length;
    
    // Changing fossil's cards name and dating
    for (let i=0 ; i < smallest_length ; i++) {
        fossils_cards_name[i].innerText = filtered_fossils[i]['name'];
        fossils_cards_dating[i].innerText = `- ${filtered_fossils[i]['dating']} Ma`;
    }

    // Hiding overflowing cards
    for (let i = smallest_length ; i < fossils_cards_name.length ; i++) {
        fossils_cards[i].style.display = 'none';
    }
} else if (localStorage.getItem('is_exposed') === "true" || localStorage.getItem('continent') !== "none_continent" || localStorage.getItem('chosed_collection') !== "all_collections") {
    // Hiding fossil's cards
    for (let i = 0 ; i < fossils_cards_name.length ; i++) {
        fossils_cards[i].style.display = 'none';
    }

    fossils_notfound.style.display = 'block';
    document.querySelector('.catalogue_nav').style.display = 'none';
} else {
    for (let i=0 ; i < fossils_cards_name.length ; i++) {
        fossils_cards_name[i].innerText = fossils_db[i]['name'];
        fossils_cards_dating[i].innerText = `- ${fossils_db[i]['dating']} Ma`;
    }
}
// console.log(fossils_cards_name[0]);
// console.log(filtered_fossils[i]);
// console.log(filtered_fossils);
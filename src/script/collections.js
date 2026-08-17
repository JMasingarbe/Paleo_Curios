//////// Filters
const filters_button = document.querySelector('#filters_button');
const filters_form = document.querySelector('form');

// Listen click on searchbar's filters button
filters_button.addEventListener('click', ()=> {
    // Display or not the filters
    filters_form.style.display === '' || filters_form.style.display === 'none' ? filters_form.style.display = 'block' : filters_form.style.display = 'none';
});

// Listen click on filters' close button
const closing_filters = document.querySelector('#closing_filters');

closing_filters.addEventListener('click', ()=> {
    // Filters disappear
    filters_form.style.display = 'none';
})

// Listen click on filter saving button
const submit_filters_button = document.querySelector('#submit_filters_button');
const is_exposed = document.querySelector('#is_exposed');
const continent = document.querySelector('#continent');
const select_collection = document.querySelector('#select_collection');
const search_country = document.querySelector('#search_country');

submit_filters_button.addEventListener('click', ()=> {
    // Save in localStorage all filters
    localStorage.setItem('is_exposed', is_exposed.checked);
    localStorage.setItem('continent', continent.value);
    localStorage.setItem('chosed_collection', select_collection.value);
    localStorage.setItem('search_country', search_country.value);
    document.location.href = 'collection.html';
})

//////// Saving collection when click on card / link 's collection
const a_collection = document.querySelectorAll('a[href="collection.html"]');

// On each <a> directing to collection.html, listen and save wich collection was click on
for (let i = 0 ; i<a_collection.length ; i++) {
    a_collection[i].addEventListener('click', ()=> {
        localStorage.setItem('chosed_collection', a_collection[i].id);
    })
}
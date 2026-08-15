//////// Displaying filters
const filters_button = document.querySelector('#filters_button');
const filters_form = document.querySelector('form');

// console.log(filters_form.style.display);

// Listen click on filters button
filters_button.addEventListener('click', ()=> {
    // Display or not the filters
    filters_form.style.display === '' || filters_form.style.display === 'none' ? filters_form.style.display = 'block' : filters_form.style.display = 'none';
});
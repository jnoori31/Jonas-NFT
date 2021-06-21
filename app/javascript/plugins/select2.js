import 'select2';
import $ from 'jquery';

const initSelect2 = () => {
    $('select.select2-category').select2({
        // placeholder: 'Select a category',    
        allowClear: true,
        closeOnSelect: true
    });
    // const divselect = document.querySelector('.select2-category');
    const submitCat = document.getElementById('submit-category');
    console.log(submitCat);
    const btnSubmit = document.getElementById('btn-submit-category');

    btnSubmit.addEventListener('click', (event) => {
        const optionTitle = document.querySelector('.select2-selection__choice__display');
        if (optionTitle) {
            submitCat.value = optionTitle.innerText.toLowerCase();
        }
    })
}

export { initSelect2 };
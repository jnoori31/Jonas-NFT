import 'select2';
import $ from 'jquery';

const initSelect2 = () => {
    $('select.select2-category').select2({
        allowClear: true,
        closeOnSelect: true
    });
    const submitCat = document.getElementById('submit-category');
    const btnSubmit = document.getElementById('btn-submit-category');
    if (btnSubmit) {
        btnSubmit.addEventListener('click', (event) => {
            const ulCategories = document.querySelector('.select2-selection__rendered');
            const elements = ulCategories.querySelectorAll('.select2-selection__choice__display')
            if (ulCategories) {
                let categories = "";
                elements.forEach((el) => {
                    categories += `${el.innerText.toLowerCase()} `;
                })
                submitCat.value = categories;
            }
        })
    }
}

export { initSelect2 };
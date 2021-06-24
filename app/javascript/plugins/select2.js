import 'select2';
import $ from 'jquery';

const initSelect2 = () => {
    // making select2 work
    $('select.select2-category').select2({
        allowClear: true,
        closeOnSelect: true
    });
    // 
    const submitCat = document.getElementById('submit-category');
    const btnSubmit = document.getElementById('btn-submit-category');
    if (btnSubmit) {
        btnSubmit.addEventListener('click', (event) => {
            const ulCategories = document.querySelector('.select2-selection__rendered');
            // getting the ul which contains the li of the selected options, you can see in the inspect
            const elements = ulCategories.querySelectorAll('.select2-selection__choice__display');
            // selectinng all options from the ul
            if (ulCategories) {
                let categories = "";
                elements.forEach((el) => {
                    categories += `${el.innerText.toLowerCase()} `;
                })
                // purpose its to get all categories in lower case to match the seed style
                submitCat.value = categories; //see the home page
            }
        })
    }
}

export { initSelect2 };

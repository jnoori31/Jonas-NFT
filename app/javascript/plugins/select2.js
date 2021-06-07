import 'select2';
import $ from 'jquery';

const initSelect2 = () => {
    $('select.select2-category').select2({
        placeholder: 'Select a category',
        width: '40%',
        height: '20px'
    });
    // const value = $('select.select2-category').find(':selected')[0].innerText;
    // console.log(value);
}

export { initSelect2 };
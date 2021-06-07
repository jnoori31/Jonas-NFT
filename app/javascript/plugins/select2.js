import 'select2';
import $ from 'jquery';

const initSelect2 = () => {
    if ($('select.select2-category')) {
        $('select.select2-category').select2({
            placeholder: 'Select a category',
            width: '40%',
            height: '20px'
        });
    }
}

export { initSelect2 };
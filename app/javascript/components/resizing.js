const initResizingLeft = () => {
    const container = document.querySelector('.card-right');
    const main_container = document.querySelector('.main-container');;

    const resizeObserver  = new ResizeObserver(function (entries) {
        entries.forEach(entry => {
            // console.log(entry);

            if (entry.contentBoxSize[0].inlineSize < 900 ) {
                container.setAttribute('hidden', true);
            } else {
                container.removeAttribute('hidden');
            }
        });
    });

    if (main_container) {
        resizeObserver.observe(main_container);
    }
}    

export { initResizingLeft };

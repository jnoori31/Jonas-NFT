const initResizingLeft = () => {
    const container = document.querySelector('.card-right');
    const main_container = document.querySelector('.main-container');;
    const search_bar = document.querySelector('.card-follow-category');
    // const resizeObserver  = new ResizeObserver(function (entries) {
    //     entries.forEach(entry => {
    //         // console.log(entry);

    //         if (entry.contentBoxSize[0].inlineSize < 900 ) {
    //             container.setAttribute('hidden', true);
    //         } else {
    //             container.removeAttribute('hidden');
    //         }
    //     });
    // });

    // if (main_container) {
    //     resizeObserver.observe(main_container);
    // }
    if (main_container && container) {
        window.addEventListener('resize', (event) => {
            if (window.innerWidth < 1100) {
                container.setAttribute('hidden', true);
            } else {
                container.removeAttribute('hidden');
            }
            if (window.innerWidth < 1500) {
                search_bar.setAttribute('hidden', true);
            } else {
                search_bar.removeAttribute('hidden');
            }
        })
    }
}    

export { initResizingLeft };

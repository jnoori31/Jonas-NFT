const initResizingLeft = () => {
    const container = document.querySelector('.card-right');
    const main_container = document.querySelector('.main-container');;
    const search_bar = document.querySelector('.card-follow-category');
    const left_container = document.querySelector('.card-left');
    const center_card = document.querySelector('.card-center');
    const new_nft = document.querySelector('.card-new-nft');
    const nft_container_user = document.querySelector('.card-user-profile-category');
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
            if (window.innerWidth < 1650) {
                search_bar.setAttribute('hidden', true);
            } else {
                search_bar.removeAttribute('hidden');
            }
            if (window.innerWidth < 900) {
                left_container.setAttribute('hidden', true);
                center_card.style.width = "90%";
            } else {
                left_container.removeAttribute('hidden');
                center_card.style.width = "44%";
            }
        })
    };
    if (new_nft) {
        window.addEventListener('resize', (event) => {
            if (window.innerWidth < 1000) {
                new_nft.style.width = "90%";
            } else {
                new_nft.style.width = "50%";
            }
        })
    };
    if (nft_container_user) {
        window.addEventListener('resize', (event) => {
            if (window.innerWidth < 1200) {
                nft_container_user.setAttribute('hidden', true);
            } else {
                nft_container_user.removeAttribute('hidden');
            }
        })
    }
}    

export { initResizingLeft };

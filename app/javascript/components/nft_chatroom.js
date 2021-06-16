const nftChatroom = () => {
    const divBtn = document.querySelector('.nft-chatroom');
    const hiddenField = document.getElementById('hidden-field-chatroom');
    if (divBtn) {
        const links = divBtn.querySelectorAll('.img-over');
        links.forEach((link) => {
            link.addEventListener('click', (event) => {
                // let varHTTP = new XMLHttpRequest();
                // varHTTP.onreadystatechange = () => {
                //     if (varHTTP.status == 200 && varHTTP.readyState == 4) {
                //         alert("hello");
                //     }
                // }
                // varHTTP.open("GET", "/api");
                // varHTTP.send();
                hiddenField.value = link.dataset.nftUrl;
            })
        })
    }
}

export { nftChatroom };
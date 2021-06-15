const initFollowBtn = () => {
    const divBtn = document.querySelector('.cards-suggestion');
    if (divBtn) {
        const links = divBtn.querySelectorAll('.link-suggestion');
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
                link.childNodes[3].innerText = "hey";
            })
        })
    }
}

export { initFollowBtn };
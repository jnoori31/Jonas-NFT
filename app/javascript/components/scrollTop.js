const initScrollTop = () => {
    window.addEventListener('scroll', (event) => {
        const btnTop = document.getElementById('topBtn');
        if (window.scrollY > 40) {
            btnTop.addEventListener('click', (event) => {
                document.body.scrollTop = 0; 
                document.documentElement.scrollTop = 0;
            })
            $('#topBtn').fadeIn();
            btnTop.style.display = "block";
        } else {
            $('#topBtn').fadeOut();
            btnTop.style.display = "none";
        }
    })
}

export { initScrollTop };
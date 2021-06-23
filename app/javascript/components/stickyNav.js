const initStickyNav = () => {
  const banner = document.querySelector(".banner");
  const mainNavbar = document.querySelector("#navbar");
  const home_title = document.getElementById('home-link');
  const new_nft_link = document.getElementById('new-nft-navlink');
  const loginNavbar = document.getElementById('login-navbar');
  const bell = document.getElementById('bellDropdown');

  const observerOptions = {
    root: null,
    threshold: 0,
    rootMargin: "-80px 0px 0px 0px"
  };

  const observer = new IntersectionObserver(function (entries, observer) {
    entries.forEach(entry => {
      // console.log(entry);

      if (entry.isIntersecting == false) {
        mainNavbar.classList.add('navbar-alternate');
        home_title.style.color = "#ffffff";
        if (loginNavbar) {
          loginNavbar.style.color = "#ffffff";
        };
        if (new_nft_link) {
          new_nft_link.style.color = "#ffffff";
          bell.style.color = "#ffffff";
        }
      } else {
        mainNavbar.classList.remove('navbar-alternate');
        home_title.style.color = "#2f6097";
        if (loginNavbar) {
          loginNavbar.style.color = "#2f6097";
        };
        if (new_nft_link) {
          new_nft_link.style.color = "#2f6097";
          bell.style.color = "#2f6097";
        }
      }

    });
  }, observerOptions);

  if (banner) {
    observer.observe(banner);
  }
}  

export { initStickyNav };

// To understand more about intersectionObservable API watch
// https://www.youtube.com/watch?v=T8EYosX4NOo&t=772s

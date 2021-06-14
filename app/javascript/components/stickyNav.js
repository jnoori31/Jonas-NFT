const banner = document.querySelector(".banner");
const mainNavbar = document.querySelector("#navbar");

const observerOptions = {
  root: null,
  threshold: 0,
  rootMargin: "-80px 0px 0px 0px"
};

const observer = new IntersectionObserver(function (entries, observer) {
  entries.forEach(entry => {
    console.log(entry);

    if (entry.isIntersecting == false) {
      mainNavbar.classList.add('navbar-alternate');
    } else {
      mainNavbar.classList.remove('navbar-alternate');
    }

    // if (entry.isVisible == false) {
    //   mainNavbar.classList.add('navbar-alternate');
    // } else {
    //   mainNavbar.classList.remove('navbar-alternate');
    // }

  });
}, observerOptions);

observer.observe(banner);

const hideFooterOnScroll = () => {
  const navbar = document.querySelector(".navbar-karma");
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > 10){
        navbar.classList.add("navbar-karma-hide");
      } else {
        navbar.classList.remove("navbar-karma-hide");
      }
    });
  }
}

export { hideFooterOnScroll };

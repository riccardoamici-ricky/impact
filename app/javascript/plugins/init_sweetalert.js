import Swal from 'sweetalert2'

const initSweetalert = () => {
  const button = document.querySelector(".sweetalert")
  if (button) {
    button.addEventListener("click", (event) => {
      event.preventDefault()
      Swal.fire({
        icon: 'warning',
        title: 'Are you sure?',
        text: 'You are about to spend 10 karma points to get a 10% discount code for this product',
        preConfirm: () => {
          fetch("/buy").then(() => {
            window.open(button.dataset.url, '_blank');
          })
        }
      })
    })

  }
}

export { initSweetalert }

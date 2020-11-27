const initTrash = () => {
  const showTrash = (e) => {
    console.log(document.querySelector(".fa-trash"))
    console.log(e.currentTarget);
    e.currentTarget.querySelector(".fa-trash").classList.toggle("hidden");
  }
  const comments = document.querySelectorAll('.comment-item');
  comments.forEach ((comment) => {
  comment.addEventListener('click', showTrash);
  });
}
export { initTrash };

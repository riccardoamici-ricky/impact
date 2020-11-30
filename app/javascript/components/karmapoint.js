const decreaseKarmapoints = () => {
  const karma = document.querySelector('.karmajs');
  karma.addEventListener('click', (event) => {
    // Callback
    let points = document.getElementById('karmapoints').innerText
    const new_value = parseInt(points) - 10
    console.log(new_value);
    document.getElementById('karmapoints').innerText = new_value
    console.log(points);
  });
}


export { decreaseKarmapoints };

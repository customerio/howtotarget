const input = document.querySelector("input");
const notFound = document.getElementById("empty-state");

const filterFunction = () => {
  const cards = document.querySelectorAll(".hack");
  cards.forEach((item) => {
    let whatToSearch = item.querySelector(".hack__client");
    if (
      whatToSearch.innerHTML.toUpperCase().indexOf(input.value.toUpperCase()) >
      -1
    ) {
      item.style.display = "";
      notFound.style.display = "none";
    } else {
      item.style.display = "none";
      notFound.style.display = "block";
    }
  });
};
input.addEventListener("keyup", filterFunction);

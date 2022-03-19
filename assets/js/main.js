let searchInput = document.getElementById("filter-input");
let hacks = document.querySelectorAll(".hack");

function liveSearch() {
  let search_query = document.getElementById("filter-input").value;

  for (var i = 0; i < hacks.length; i++) {
    let hackHeading = hacks[i].querySelector(".hack__heading");

    if (
      hackHeading.textContent.toLowerCase().includes(search_query.toLowerCase())
    ) {
      hacks[i].classList.remove("hidden");
    } else {
      hacks[i].classList.add("hidden");
    }
  }
}

searchInput.addEventListener("keyup", () => {
  liveSearch();
});

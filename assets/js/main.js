let searchInput = document.getElementById("filter-input");
let hacks = document.querySelectorAll(".hack");
let emptyState = document.getElementById("empty-state");

function liveSearch() {
  let search_query = document.getElementById("filter-input").value;

  //Use innerText if all contents are visible
  //Use textContent for including hidden elements
  for (var i = 0; i < hacks.length; i++) {
    if (
      hacks[i].textContent.toLowerCase().includes(search_query.toLowerCase())
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

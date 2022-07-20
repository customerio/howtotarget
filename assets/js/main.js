// Live filtering of the hacks
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

// toggle deprecated hacks
let deprecatedCheckbox = document.getElementById("filter-deprecated");
let hacksWrapper = document.querySelector('.hacks');

deprecatedCheckbox.addEventListener("change", () => {
  hacksWrapper.classList.toggle('hacks--show-deprecated', deprecatedCheckbox.checked);
});

// Copy button
const codeBlocks = document.querySelectorAll(
  ".copy-button + .highlighter-rouge"
);
const copyCodeButtons = document.querySelectorAll(".copy-button");

copyCodeButtons.forEach((copyCodeButton, index) => {
  const code = codeBlocks[index].innerText;

  copyCodeButton.addEventListener("click", () => {
    window.navigator.clipboard.writeText(code);
    copyCodeButton.classList.add("copied");

    setTimeout(() => {
      copyCodeButton.classList.remove("copied");
    }, 2000);
  });
});

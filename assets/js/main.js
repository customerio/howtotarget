document.addEventListener("DOMContentLoaded", function () {
  // Live filtering of the hacks
  let searchInput = document.getElementById("filter-input");
  let hacks = document.querySelectorAll(".hack");

  function liveSearch() {
    let search_query = document.getElementById("filter-input").value;

    for (var i = 0; i < hacks.length; i++) {
      let hackHeading = hacks[i].querySelector(".hack__heading");

      if (
        hackHeading.textContent
          .toLowerCase()
          .includes(search_query.toLowerCase())
      ) {
        hacks[i].classList.remove("hidden");
      } else {
        hacks[i].classList.add("hidden");
      }
    }
  }

  var prepopulatedWord = getURLParameter("client");
  if (prepopulatedWord) {
    searchInput.value = prepopulatedWord;
  }

  searchInput.addEventListener("keyup", () => {
    liveSearch();
  });

  liveSearch();
});

function getURLParameter(name) {
  return (
    decodeURIComponent(
      (new RegExp("[?|&]" + name + "=" + "([^&;]+?)(&|#|;|$)").exec(
        location.search
      ) || [null, ""])[1].replace(/\+/g, "%20")
    ) || null
  );
}

// toggle deprecated hacks
let deprecatedCheckbox = document.getElementById("filter-deprecated");
let hacksWrapper = document.querySelector(".hacks");

deprecatedCheckbox.addEventListener("change", () => {
  hacksWrapper.classList.toggle(
    "hacks--show-deprecated",
    deprecatedCheckbox.checked
  );
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

// subscribe form
const subscribeForm = document.getElementById("subscribe-form");

subscribeForm.addEventListener("submit", async (e) => {
  e.preventDefault();

  try {
    const response = await fetch(`/api/subscribe`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        email: e.target.elements.email.value,
      }),
    });

    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    subscribeForm.classList.add("subscribe--submitted");
  } catch (e) {
    alert("Something went wrong! Please try again later.");
    return;
  }
}); // JavaScript Document

document.addEventListener("DOMContentLoaded", function () {
  // Live filtering of the hacks
  let searchInput = document.getElementById("filter-input");
  let hacks = document.querySelectorAll(".hack");

  function liveSearch() {
    let searchQuery = searchInput.value.toLowerCase().trim();
    let searchWords = searchQuery.split(/\s+/);

    for (var i = 0; i < hacks.length; i++) {
      let hackHeadingText = hacks[i]
        .querySelector(".hack__heading")
        .innerText.toLowerCase();

      let isMatch = searchWords.every((word) => hackHeadingText.includes(word));

      if (isMatch) {
        hacks[i].classList.remove("hidden");
      } else {
        hacks[i].classList.add("hidden");
      }
    }
  }

  let client = getURLParameter("client");
  let platform = getURLParameter("platform");
  let q = getURLParameter("q");

  let combinedSearchString = "";
  if (client) {
    combinedSearchString += client;
  }
  if (platform) {
    combinedSearchString += " " + platform;
  }
  if (q) {
    combinedSearchString += " " + q;
  }

  combinedSearchString = combinedSearchString.trim();

  searchInput.value = combinedSearchString;

  searchInput.addEventListener("keyup", () => {
    liveSearch();
  });

  liveSearch();
});

// share link
let shareButton = document.getElementById("shareButton");
shareButton.addEventListener("click", shareLink);

function shareLink() {
  let searchInput = document.getElementById("filter-input");
  const copied = document.querySelector("#shareButton span");
  let deprecatedCheckbox = document.getElementById("filter-deprecated");
  let currentSearchValue = searchInput.value;
  let depChecked = "";

  if (deprecatedCheckbox.checked) {
    depChecked += "&deprecated=true";
  }
  let url = `https://www.howtotarget.email/?q=${encodeURIComponent(
    currentSearchValue
  )}${depChecked}`;
  navigator.clipboard
    .writeText(url)
    .then(() => {
      copied.classList.add("success");
      setTimeout(() => {
        copied.classList.remove("success");
      }, 2000);
    })
    .catch((err) => {
      console.error("Error in copying text: ", err);
    });
}

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
document.addEventListener("DOMContentLoaded", function () {
  let depURL = getURLParameter("deprecated");
  let deprecatedCheckbox = document.getElementById("filter-deprecated");
  let hacksWrapper = document.querySelector(".hacks");

  if (depURL === "true") {
    deprecatedCheckbox.checked = true;
    hacksWrapper.classList.add("hacks--show-deprecated");
  }

  deprecatedCheckbox.addEventListener("change", () => {
    hacksWrapper.classList.toggle(
      "hacks--show-deprecated",
      deprecatedCheckbox.checked
    );
  });
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

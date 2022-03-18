(function () {
  $(document).ready(function () {
    var emptyStateChecker;
    emptyStateChecker = function () {
      return setInterval(function () {
        if ($(".hack").is(":visible")) {
          return $(".hacks__empty").hide();
        } else {
          $(".hacks__empty").fadeIn();
          return $(".hacks__empty").css("display", "flex");
        }
      }, 250);
    };
    $(".controls__deprecated input").click(function () {
      var deprecatedHack;
      deprecatedHack = $(".hack__status--deprecated").closest(".hack");
      if ($(this).is(":checked")) {
        deprecatedHack.slideDown();
      } else {
        deprecatedHack.slideUp();
      }
      return emptyStateChecker();
    });
    return $("#filter-input").bind(
      "keyup change input focus blur",
      function (e) {
        var valThis;
        emptyStateChecker();
        valThis = $(this).val().toLowerCase();
        if (valThis === "") {
          $(".controls__deprecated").removeClass("disabled");
        } else {
          $(".controls__deprecated").addClass("disabled");
        }
        return $(".hack__client").each(function () {
          var text;
          text = $(this).text().toLowerCase();
          if (text.indexOf(valThis) === 0) {
            return $(this)
              .closest(".hack")
              .not(".hack--deprecated")
              .slideDown();
          } else {
            return $(this).closest(".hack").slideUp();
          }
        });
      }
    );
  });
}.call(this));

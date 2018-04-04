$(function() {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    // console.log(nextId);
    $.getJSON("/test_cases/" + nextId + ".json", function(data) {
      console.log(data.test_steps);
      $("div.next_tc").append(`<h2>Title: ${data.title}</h2><div id=${data.id}></div>`);
      if (data.test_steps) {
        data.test_steps.forEach(function(ele) {
          $(`div#${data.id}`).append(`<li>${ele.description}</li>`)
          //console.log(ele.description);
        })
      }
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
  
});
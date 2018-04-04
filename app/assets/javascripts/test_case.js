$(function() {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    // console.log(nextId);
    $.getJSON("/test_cases/" + nextId + ".json", function(data) {
      console.log(data);
      $("div.next_tc").append(`<h2>Title: ${data.title}</h2>`);
      // $(".authorName").text(data["author"]["name"]);
      // $(".postTitle").text(data["title"]);
      // $(".postBody").text(data["description"]);
      // // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
  
});
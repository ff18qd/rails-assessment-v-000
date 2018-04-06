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
  
  
  $('form').submit(function(event) {
      //prevent form from submitting the default way
      event.preventDefault();
      // alert("we r hack3rz");
      // debugger
      const values = $(this).serialize();
      // console.log(event.serializeArray());
      // const description = $(this).test_step_description.value;
      // const url = $(this).action;
      // const token = $(this).authenticity_token.value;
      // const note = $(this).test_step_note.value;
      
      $.ajax({
        type: "POST",
        url: this.action,
        data: values,
        success: function(resp) {
          console.log(resp)
        }
        
      });
      
    });
  
});
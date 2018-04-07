$(function() {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    // console.log(nextId);
    $.getJSON("/test_cases/" + nextId + ".json", function(data) {
      console.log(data.test_steps);
      $("div.next_tc").append(`<h2>Title: ${data.title}</h2><div id=${data.id}></div>`);
      // $("div.next_tc").append(`<h2>Title: ${data.title}</h2><div id=${data.id}></div>`);
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
          // debugger
          // console.log(resp.description);
          let newStep = new testStep(resp);
          console.log(newStep);
          $("input#test_step_description").val('');
          $("input#test_step_test_case_test_steps_note").val('');
          // $('ul.sortable').append(`<li id="TestCaseTestStep_${resp.test_case_test_steps[0].id}"  class = "ui-sortable-handle">${resp.description} | Note: ${resp.test_case_test_steps[0].note}</li>`)
          let stepHtml = newStep.formatStep();
          console.log(stepHtml);
          $('ul.sortable').append(stepHtml);
          
        }
        
      });
      
    });
  
});


function testStep (response) {
  this.description = response.description;
  this.test_case_test_steps_id = response.test_case_test_steps[0].id;
  this.note = response.test_case_test_steps[0].note;
}

testStep.prototype.formatStep = function() {
  let stepHtml = `<li id="TestCaseTestStep_${this.test_case_test_steps_id}" class = "ui-sortable-handle">${this.description} | Note: ${this.note}</li>`;
  
  return stepHtml;
}
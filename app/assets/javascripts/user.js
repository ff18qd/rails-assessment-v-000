$(function() {
    $("a#testcases").click(function(e) {
        // alert("clicked memememe");
        // debugger
        console.log(this.href)
        $.get(this.href, function(resp) {
            // console.log(resp);
            resp.filter(testCase => testCase.test_steps.length > 4)
              .forEach(element => $("div#listtestcases").append(`<li>${element.title}</li>`))
            
            // resp.forEach(function(element) {
                
               
            //     $("div#listtestcases").append(`<li>${element.title}</li>`);
            // })
        })
       
        e.preventDefault();
        
    });
    
})
// words.filter(word => word.length > 6);

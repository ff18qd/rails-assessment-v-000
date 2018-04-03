$(function() {
    $("a#testcases").click(function(e) {
        // alert("clicked memememe");
        // debugger
        console.log(this.href)
        $.get(this.href, function(resp) {
        // console.log(resp);
            resp.forEach(function(element) {
                $("div#listtestcases").append(`<li>${element.title}</li>`);
            })
        })
       
        e.preventDefault();
        
    });
    
})
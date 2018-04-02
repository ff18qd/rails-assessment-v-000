function loadTestCases(userid) {
    $.get("/users/" + userid + "/test_cases", function(resp) {
        // console.log(resp);
        resp.forEach(function(element) {
            $("div#testcases").append(element.title);
        })
    })
}


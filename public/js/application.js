$(document).ready(function() {
	$('#error-signup').delay(2500).fadeTo(1000, 0);
})

$(document).ready(function() {
	$('#login-succes').delay(2500).fadeTo(1000, 0);
})

$(document).ready(function(){
    $('input[name="upvote-button"]').click(function(event){
    	event.preventDefault();
        $(this).attr("value", "Upvoted!");
        var $value = $("#output").attr("value")
        $.ajax({
      		url: '/upvote_answer/' + $value,
      		dataType: 'json',
      		type: 'POST',
  		});
    });
})

// use names when combining with bootstrap. When using id's only the first id is used. //
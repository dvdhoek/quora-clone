var form = $(this),
    formData = form.serialize(),
    formUrl = form.attr('action'),
    formMethod = form.attr('method'), 
    responseMsg = $('#signup-response')

//show response message waiting
responseMsg.hide()
           .addClass('response-waiting')
           .text('Please Wait...')
           .fadeIn(200);
$("form#member").bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      alert('success!!');
      # $('#sign_in_button').hide()
      # $('#submit_comment').slideToggle(1000, "easeOutBack" )
    else
      alert('failure!')

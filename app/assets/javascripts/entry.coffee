toggle_judging_times = ->
  if $("#entry_skill_level").length
    if $("#entry_skill_level").val().toLowerCase().indexOf('exhibition') > -1
      $("#entry_judging_time_id").val(0)
      $("#entry_judging_time_id_available").addClass('hidden')
      $("#entry_judging_time_id_unavailable").removeClass('hidden')
    else
      $("#entry_judging_time_id_available").removeClass('hidden')
      $("#entry_judging_time_id_unavailable").addClass('hidden')
    return

ready = ->
  toggle_judging_times()
  $("#entry_skill_level").change( ->
    toggle_judging_times()
  )
  $('.container').on('cocoon:after-remove', (e, removed_item) ->
    $('#cosplay_delete_alert').removeClass('hidden')
  )

$(document).ready(ready)

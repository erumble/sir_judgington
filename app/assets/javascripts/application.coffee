# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require cocoon
#= require typeahead
#= require_tree .


aw_snaps = ->
  window.aw_snaps = {}
  window.aw_snaps.emails = new Bloodhound(
    datumTokenizer: (d) ->
      return Bloodhound.tokenizers.whitespace(d.email)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    prefetch: "/entries/person_json_blob.json"
  )

  window.aw_snaps.emails.clearPrefetchCache();
  window.aw_snaps.emails.initialize()

  emailTypeahead = $(".persons .typeahead");

  window.aw_snaps.emailItemSelectedHandler = (eventObject, suggestionObject, suggestionDataset) ->
    # debugger
    # $($(eventObject.currentTarget).closest(".persons").find("input.id")[0]).val(suggestionObject.id)
    $($(eventObject.currentTarget).closest(".persons").find("input.first_name")[0]).val(suggestionObject.first_name)
    $($(eventObject.currentTarget).closest(".persons").find("input.last_name")[0]).val(suggestionObject.last_name)
    $($(eventObject.currentTarget).closest(".persons").find("input.phonetic_spelling")[0]).val(suggestionObject.phonetic_spelling)
    return

  return

$(document).ready ->
  $("#dude").dataTable lengthChange: false, pageLength: 200
  aw_snaps()
  return

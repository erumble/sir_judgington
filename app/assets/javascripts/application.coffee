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
#= require underscore-min
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
  window.aw_snaps.characters = new Bloodhound(
    datumTokenizer: (d) ->
      return Bloodhound.tokenizers.whitespace(d.name)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    prefetch: "/entries/character_json_blob.json"
  )
  window.aw_snaps.characters2 = new Bloodhound(
    datumTokenizer: (d) ->
      return Bloodhound.tokenizers.whitespace(d.property)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    prefetch: "/entries/character_json_blob.json"
  )
  window.aw_snaps.emails.clearPrefetchCache();
  window.aw_snaps.emails.initialize()

  window.aw_snaps.characters.clearPrefetchCache();
  window.aw_snaps.characters.initialize()

  window.aw_snaps.characters2.clearPrefetchCache();
  window.aw_snaps.characters2.initialize()

  emailTypeahead = $(".persons .typeahead");
  emailTypeahead = $(".characters .typeahead");

  window.aw_snaps.emailItemSelectedHandler = (eventObject, suggestionObject, suggestionDataset) ->
    # debugger
    # $($(eventObject.currentTarget).closest(".persons").find("input.id")[0]).val(suggestionObject.id)
    $($(eventObject.currentTarget).closest(".persons").find("input.first_name")[0]).val(suggestionObject.first_name)
    $($(eventObject.currentTarget).closest(".persons").find("input.last_name")[0]).val(suggestionObject.last_name)
    $($(eventObject.currentTarget).closest(".persons").find("input.phonetic_spelling")[0]).val(suggestionObject.phonetic_spelling)
    return
  window.aw_snaps.characterItemSelectedHandler = (eventObject, suggestionObject, suggestionDataset) ->
    # debugger
    # $($(eventObject.currentTarget).closest(".persons").find("input.id")[0]).val(suggestionObject.id)
    # $($(eventObject.currentTarget).closest(".characters").find("input.name")[0]).val(suggestionObject.name)
    $($(eventObject.currentTarget).closest(".characters").find("input.property.tt-input")[0]).val(suggestionObject.property)
    # $($(eventObject.currentTarget).closest(".characters").find("input.property")[0]).focus()
    # $(eventObject.currentTarget).focus()
    return
  window.aw_snaps.character2ItemSelectedHandler = (eventObject, suggestionObject, suggestionDataset) ->
    # debugger
    # $($(eventObject.currentTarget).closest(".persons").find("input.id")[0]).val(suggestionObject.id)
    $($(eventObject.currentTarget).closest(".characters").find("input.name.tt-input")[0]).val(suggestionObject.name)
    # $($(eventObject.currentTarget).closest(".characters").find("input.name")[0]).focus()
    # $(eventObject.currentTarget).focus()
    # $($(eventObject.currentTarget).closest(".characters").find("input.property")[0]).val(suggestionObject.property)
    return

  return

$(document).ready ->
  $("#dude").dataTable lengthChange: false, pageLength: 200, aaSorting: []
  aw_snaps()
  return

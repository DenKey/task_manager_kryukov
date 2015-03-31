# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready =  ->
  $("#new_list").on("ajax:success", (e, data, status, xhr) ->
    location.reload true
  ).on "ajax:error", (e, xhr, status, error) ->
    location.reload true
  $("#deletelist").on("ajax:success", (e, data, status, xhr) ->
    location.reload true
  ).on "ajax:error", (e, xhr, status, error) ->
    location.reload true


$(document).ready(ready)
$(document).on('page:load', ready)
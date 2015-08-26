# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
$(".add_new_project").on("ajax:success", (e, data, status, xhr) ->
    $(".add_new_project").append xhr.responseText
   ).on "ajax:error", (e, xhr, status, error) ->
    $(".add_new_project").append "<p>ERROR</p>"
    console.log("test")
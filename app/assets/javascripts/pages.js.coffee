# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#ugly method
$(document).ready ->
  $('.span4').height($('.span8').height()) if $('.span4').find('a').length > 0
  $(".checkbox").click ->
    id = $(@).attr("id")
    $(".icon-check").removeClass("icon-check").addClass("icon-check-empty")
    $(@).find("i").removeClass("icon-check-empty").addClass("icon-check")
    $("input[value=#{id}]").click()


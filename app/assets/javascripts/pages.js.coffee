# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#ugly method
$(document).ready ->
  $('.span4').height($('.span8').height()) if $('.span4').find('a').length > 0

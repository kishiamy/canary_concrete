$(document).ready ->
  $(".nav li").each ->
    $(this).addClass "active"  if $(this).children().attr("href") is window.location.pathname

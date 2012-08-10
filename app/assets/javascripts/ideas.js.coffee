# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#ideas_filter").change ->
    filter_by = $(this).val()
    $.ajax
      url: '/ideas'
      dataType: 'html'
      data:{criteria:filter_by}
      success: (response) ->
        $("div.ideas").html(response)

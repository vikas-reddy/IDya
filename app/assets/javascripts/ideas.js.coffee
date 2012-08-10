# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  $(".ideas-filter").change (e) ->
    e.preventDefault()

    filter_by = $('#ideas-filter-by').val()
    order_by = $('#ideas-order-by').val()

    $.ajax
      url:      '/ideas'
      dataType: 'html'
      data:
        filter_by: filter_by
        order_by: order_by
      beforeSend: ->
        $('#ideas-list').fadeOut()
        $('#ideas-progress').fadeIn()
      success:  (response) ->
        $("#ideas-list").html(response).fadeIn()
        $('#ideas-progress').hide()
        $('#ideas-list').fadeIn()
        true

  true

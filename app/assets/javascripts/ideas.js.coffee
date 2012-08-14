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
  
  $("#post_improvisation").click (e) ->
    e.preventDefault()
  
    idea_id = $("#hidden_idea_id").val()
    desc =  $("#improvisation-textarea").val()
    if (desc.trim() != '')
      $.ajax
        url:      '/ideas/'+idea_id+'/post_improvisation'
        dataType: 'html'
        type: 'POST'
        data:
          content: desc
        beforeSend: ->
        success:  (response) ->
          $("#improvisation-textarea").val('')
          $("#improvisations_list").html(response)
          true
      true
    else
      alert "Please enter improvisation text."
  true
  
  $("#post_comment").click (e) ->
    e.preventDefault()
  
    idea_id = $("#hidden_idea_id").val()
    desc =  $("#comments-textarea").val()
    if (desc.trim() != '')
      $.ajax
        url:      '/ideas/'+idea_id+'/post_comment'
        dataType: 'html'
        type: 'POST'
        data:
          content: desc
        beforeSend: ->
        success:  (response) ->
          $("#comments-textarea").val('')
          $("#comments_list").html(response).fadeIn()
          true
      true
    else
      alert "Please enter comments text."
  true

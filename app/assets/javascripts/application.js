// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {

      alertInfo();

      $(".vote-for").on('click',function(e){         
          voteIDya({
                     idea_id: $("#idea_id").val(),
                     vote: {for_against: 1}
                })
        });
        $(".vote-against").on('click',function(e){
          voteIDya({
                     idea_id: $("#idea_id").val(),
                     vote: {for_against: 0}
                })
        });
});


function voteIDya(data){
    $.ajax({
                type: 'POST',
                url: '/votes',
                dataType: 'json',
                data: data,
                success: function(data) {
                    if(data.for_against){
                        $('.vote-for-count').html(parseInt($('.vote-for-count').html())+1);
                     }
                     else {
                          $('.vote-against-count').html(parseInt($('.vote-for-count').html())+1);
                     }
                    $('.your-vote').html("");
                    $('.hero-unit').prepend("<div class='alert alert-success'>Thanks! Your vote was successfully sent.</div>")
                    alertInfo();
                }
            });
}

function alertInfo() { 
  setTimeout(hideFlashMessages, 3500);
}

function hideFlashMessages() {
    $('.alert').slideUp(200);
}


// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
// RENAMED TO USE 'JS' EXTENSION

$(document).ready(function(){
  findTweets();
})

function findTweets(){
  $('#form').on('submit', function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var type = $(this).attr('method');
    $.ajax({
      type: type,
      url: url,
      data: $(this).serialize(),
      dataType: 'JSON'
    }).done(function(response){
      console.log(response)
      for(var i=0; i < response.tweets.length; i++) {
        var urlAnchor = "<a href=https://twitter.com/" + response.tweets[i].user.screen_name + "/status/" + response.tweets[i].id_str + ">"
        console.log(urlAnchor)
        $('#tweet-holder').append(urlAnchor + (i+1) + ". " + response.tweets[i].text + "</a><br><br>")
      }
    })
  })
}

$(document).ready(function() {

$('.load-more').click(function(e) {
    // $('.load-more').hide();

    var lastId = $('.dog').last().attr('data-id');
    console.log(lastId)

    $.ajax({
      type: "GET",
      url: '/home',
      data: {id: lastId},
      dataType: "script",

      success: function() {
        $('.load-more').show();
      }
    })
  })
})

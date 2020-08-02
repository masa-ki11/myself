$(function(){
  function buildHTML(chat){
    if (chat) {
      let html = 
        `<div class="talk_info" data-chat-id=${chat.id}>
          <div class="name">
            ${chat.user_name}
            ${chat.created_at}
          </div>
          <div class="chat_comment">
          ${chat.comment}
          </div>
        </div>`
      return html;
    };
  };


  $(function(){
    $('.Form').on('submit', function(e){
      e.preventDefault();
      let formData = new FormData(this);
      let url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(comment){
        let html = buildHTML(comment);
        $('.comment_field').append(html);
        $('form')[0].reset();
        $('.talk_room').animate({ scrollTop: $('.talk_room')[0].scrollHeight});
        $('.submit-btn').prop('disabled', false);
      })
    });
  });
  $(window).on('load', function() {
    $('.talk_room').animate({ scrollTop: $('.talk_room')[0].scrollHeight});
  });
})
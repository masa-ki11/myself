$(function(){
  function buildHTML(chat){
    if (chat) {
      let html = 
        `<div class="talk_info" data-chat-id=${chat.id}>
          <div class="name">
            ${chat.user_name}
            ${chat.created_at}
          </div>
        </div>
        <div class="chat_comment">
          ${chat.comment}
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
        $('.submit-btn').prop('disabled', false);
      })
    });
  });
})
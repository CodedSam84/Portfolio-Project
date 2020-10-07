import consumer from "./consumer"
function createLine(data) {
  return `
    <div class="comment-card">
      <div class="card">
        <div class="row no-gutters">
          <div class="col-md-12">
            <div class="card-body" id="comment"> 
              <p class="card-text">${data['message']}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  `
}

let blogId = $('#blog-comment').data('blog-id')

const blogsChannel = consumer.subscriptions.create({ channel: "BlogsChannel", blog_id: blogId },
{ 
    received(data) {
      console.log("Welcome to ActionCable!")
      $('#blog-comment').append(createLine(data))
    },
    
    // Called once when the subscription is created.
    initialized() {
      //console.log("Welcome to ActionCable!")
    },
    
    // Called when the subscription is ready for use on the server.
    connected() {
      console.log("Welcome to ActionCable!")
    },
    
    // Called when the WebSocket connection is closed.
    disconnected() {
      
    },

    speak(message, blog_id) {
      this.perform("speak", {message: message, blog_id: blog_id})
    }
})

$(document).on('turbolinks:load', function () {
  $("#new_comment").on('submit', function(e){
    e.preventDefault();
    let message = $('#comment_content').val().trim();
    let blogId = $('#blog-comment').data('blog-id')
    if (message.length > 5) {
      blogsChannel.speak(message, blogId);
      $('#comment_content').val('')
    } else {
      $('#comment_content').val('')
      alert("comment is too short..Minimum 5 characters!");
    }
    
  });
})
import consumer from "./consumer"
$(document).on('turbolinks:load', function () {
  consumer.subscriptions.create({channel: "ChatroomChannel", chatroom_id: $("#room_messages").attr("data-room-id")}, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      $('#message-container').append(data.mod_message);
      scroll_bottom();
    }
  });
})

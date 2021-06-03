import consumer from "./consumer"

const initChatroomCable = () => {
  const messageContainer = document.getElementById('messages');
  if (messageContainer) {
    const id = messageContainer.dataset.chatroomId;
    consumer.subscriptions.create({channel: "ChatroomChannel", id: id }, {
      received(data) {
        const messageUserId = messageContainer.dataset.userId;
        const regex = /data-message-user-id="\d"/;
        const userIDString = data.match(regex)[0];
        let userID = "";
        for (let i = 0; i < userIDString.length; i++) {
          if (Number.parseInt(userIDString[i])) {
            userID += userIDString[i];
          }
        }
        if (messageUserId === userID) {
          const container = document.querySelector('.content-message-right');
          container.insertAdjacentHTML('beforeend', data);
          console.log("hey");
        } else {
          const container = document.querySelector('.content-message-left');
          container.insertAdjacentHTML('beforeend', data);
        }
      }
    })
  }
}

export { initChatroomCable };
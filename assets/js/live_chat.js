let LiveChat = {
    init(socket) {
        let channel = socket.channel('live_chat:lobby', {})
        channel.join()
        this.listenForChats(channel)
    },

    listenForChats(channel) {
        document.getElementById('chat-form').addEventListener('submit', function (e) {
            e.preventDefault()

            let userName = document.getElementById('user-name').value
            let userMsg = document.getElementById('user-msg').value

            channel.push('shout', {
                nome: userName,
                texto: userMsg
            })

            document.getElementById('user-msg').value = ''
        })

        channel.on('shout', payload => {
            const date = new Date(Date.now())
            const dateString = `${date.toISOString().slice(0,10)} ${date.toISOString().slice(11,19)}`
            let chatBox = document.querySelector('#chat-box').querySelector('.list-group')
            let msgBlock = document.createElement('li')
            msgBlock.setAttribute('class', 'list-group-item d-flex justify-content-between align-items-start')
            msgBlock.insertAdjacentHTML('beforeend',
                `<div class="ms-2 me-auto">
                    <div class="fw-bold">${payload.nome}</div>
                    ${payload.texto}
                </div>
                <span class="badge bg-primary rounded-pill">${dateString}</span>`
            )

            chatBox.appendChild(msgBlock)
        })
    }
}

export default LiveChat
Profile = React.createClass
  componentDidMount: ->
    alert("hello")
    @websocket()
  websocket: ->
    ws_rails = new WebSocketRails(location.host + "/websocket");
    # メッセージ受信時の処理
    ws_rails.bind "websocket_profile", (message) ->

      message_li = document.createElement("li")
      message_li.textContent = message

      document.getElementById("chat_area").appendChild(message_li)


    # メッセージ送信時の処理
    document.getElementById("send").onclick =  ->
      comment = document.getElementById("comment").value
      document.getElementById("comment").value = ""
      ws_rails.trigger("websocket_profile", comment)



  render: ->
    <h1>Hello</h1>

window.Profile = Profile
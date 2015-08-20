# WebsocketRails::BaseControllerを継承

class WebsocketProfileController < WebsocketRails::BaseController
  def message_recieve
    # クライアントからのメッセージを取得
    recieve_message = message()

    # websocket_chatイベントで接続しているクライアントにブロードキャスト
    broadcast_message(:websocket_profile, recieve_message)
  end
end

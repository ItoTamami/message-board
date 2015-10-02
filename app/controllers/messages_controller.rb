class MessagesController < ApplicationController
  # def index
  #end

  ##5.8 メッセージ一覧の表示　で追記


  def index
    # Messageを全て取得する。
    @messages = Message.all
  end 
 ##5.8 メッセージ一覧の表示　で追記　ここまで

  ## ここから追記
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path , notice: 'メッセージを保存しました'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end



  ## ここまで

end

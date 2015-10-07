class MessagesController < ApplicationController
  # def index
  #end

  ##5.8 メッセージ一覧の表示　で追記


  def index
    # Messageを全て取得する。
    @messages = Message.all
    @message = Message.new
  end 
 ##5.8 メッセージ一覧の表示　で追記　ここまで

  ## ここから追記
  def create
    @message = Message.new(message_params)
  #  @message.save
  #  redirect_to root_path , notice: 'メッセージを保存しました'
  # belows add at 7.2 コントローラの編集
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end

  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end



  ## ここまで

end

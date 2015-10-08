class MessagesController < ApplicationController
#before_action :set_message, only: [:edit, :update]
  before_action :set_message, only: [:edit, :update, :destroy]
  # def index
  #end
  def edit
  end

  ##5.8 メッセージ一覧の表示　で追記


  def index
    # Messageを全て取得する。
    @messages = Message.all
    @message = Message.new
  end 
 ##5.8 メッセージ一覧の表示　で追記　ここまで

  ## ここから追記
  def create
#	binding.pry
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
  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body, :age)
  end

  def set_message
    @message = Message.find(params[:id])
  end


  ## ここまで

end

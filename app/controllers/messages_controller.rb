class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  ## オブジェクトの初期化
  def index
    @message = Message.new
    # Messageを全て取得する。
    @messages = Message.all
  end

 ## メッセージ作成
  def create
    
    # インスタンス生成
    # 画面からの引数message_paramsをだ@messageに代入
    @message = Message.new(message_params)
    
    # データベースに保存
    if @message.save
      # ルートURLにリダイレクト
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
      
  end

  def edit
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

  # 画面からのパラメータはparamsで取得可能（StringParameter)
  # requireメソッドでキー:messageの検証
  # permitメソッドで値を:name,:bodyのみ受取可能なようフィルタリング
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end

  def set_message
    @message = Message.find(params[:id])
  end

end
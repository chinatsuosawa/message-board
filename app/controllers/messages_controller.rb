class MessagesController < ApplicationController
  
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

  # 画面からのパラメータはparamsで取得可能（StringParameter)
  # requireメソッドでキー:messageの検証
  # permitメソッドで値を:name,:bodyのみ受取可能なようフィルタリング
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
end
class Message < ActiveRecord::Base
    
  # 名前は必須入力かつ20文字以内
  validates :name , length: { maximum: 20 } , presence: true

  # 内容は必須入力かつ2文字以上30文字以下
  validates :body , length: { minimum: 2, maximum: 30 } , presence: true
  
  # 年齢は入力されていた場合3文字以下かつ0より大きい数値のみ
  validates :age , numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 100 }, allow_blank: true

end
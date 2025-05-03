class WeightHistory < ApplicationRecord
  belongs_to :user

  # ActiveRecordの処理の流れ
  # 1. create or update or save メソッド
  # 2. validation のチェック
  # 3. SQL の実行

  before_validation :set_memo

  validates :user_id, presence: { message: "ユーザを入力してください" }
  validates :memo, length: { maximum: 255, too_long: "メモは最大%{count}文字以内で入力してください" }
  validate :weight_validate  # カスタムvalidate  validates(標準)、validate(カスタム)

  def weight_validate
    if weight.nil? || weight < 1
      errors.add(:weight, "体重が正しくありません")
    end
  end

  def set_memo
    if memo.blank?
      self.memo = "なし"  # model内で代入するとき、self.○○とする必要がある
    end
  end
end

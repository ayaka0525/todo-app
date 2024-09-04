class Post < ApplicationRecord
    validates :title, :content, presence: true
    validates :deadline, presence: true  # 期限も必須の場合
    # 投稿を、ユーザーに紐つける
    belongs_to :user
    has_many :tasks, dependent: :destroy  # ここでタスクとのアソシエーションを設定

def formatted_deadline
    deadline.strftime('%Y-%m-%d') if deadline.present?
  end
end

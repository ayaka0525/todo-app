class Post < ApplicationRecord
    #投稿を、ユーザーに紐つける
    belongs_to :user
    has_many :tasks, dependent: :destroy  # ここでタスクとのアソシエーションを設定
end

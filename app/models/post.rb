class Post < ApplicationRecord
    #投稿を、ユーザーに紐つける
    belongs_to :user
end

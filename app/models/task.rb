class Task < ApplicationRecord
    belongs_to :post
    belongs_to :user
    belongs_to :post
    has_many :comments, dependent: :destroy
    def show
      # showアクションには特別な処理は不要、@taskがビューに渡される
    end

     # 画像のアップロードにCarrierWaveなどを使用する場合の例
     mount_uploader :image, PostMigUploader
end

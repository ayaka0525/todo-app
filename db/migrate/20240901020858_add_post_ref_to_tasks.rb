class AddPostRefToTasks < ActiveRecord::Migration[7.2]
  def change
    add_reference :tasks, :post, foreign_key: true
    end
end

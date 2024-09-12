class AddTaskRefToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :task, null: false, foreign_key: true
  end
end

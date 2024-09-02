class AddDeadlineToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :deadline, :datetime
  end
end

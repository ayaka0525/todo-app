class AddDetailsToComments < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:comments, :content)
      add_column :comments, :content, :text
    end
  end
end


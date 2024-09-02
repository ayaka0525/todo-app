# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# ユーザーを作成（パスワードを追加）
# ユーザーを作成
user = User.find_or_create_by!(email: "john@example.com") do |u|
    u.name = "John Doe"
    u.password = "password123"
    u.password_confirmation = "password123"
  end
  
  # ユーザーの名前がnilの場合、名前を設定
  if user.name.nil?
    user.update!(name: "John Doe")
  end
  
  # ポストを作成
  post = Post.find_or_create_by!(title: "Sample Post", user: user) do |p|
    p.body = "This is a sample post"
  end
  
  # タスクを作成し、ポストとユーザーに紐付け
  post.tasks.find_or_create_by!(name: "Task 1") do |task|
    task.content = "This is task 1 content"
    task.user = user
  end
  
  post.tasks.find_or_create_by!(name: "Task 2") do |task|
    task.content = "This is task 2 content"
    task.user = user
  end
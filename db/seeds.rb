# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# ユーザーを作成
user = User.create(name: "John Doe", email: "john@example.com")

# ポストを作成
post = Post.create(title: "Sample Post", body: "This is a sample post", user: user)

# タスクを作成し、ポストとユーザーに紐付け
post.tasks.create(name: "Task 1", content: "This is task 1 content", user: user)
post.tasks.create(name: "Task 2", content: "This is task 2 content", user: user)

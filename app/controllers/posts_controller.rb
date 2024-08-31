class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :edit, :destroy]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      flash[:alert] = "投稿が見つかりません"
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end



  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated"
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    Post.find(params[:id]).destroy
  # 削除リンクから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
  flash[:success] = "User deleted"
  redirect_to posts_url, status: :see_other

  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

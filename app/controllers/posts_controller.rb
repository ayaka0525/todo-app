class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
    @user_email_parts = @posts.map do |post|
      if post.user.present?
        post.user.email.split('@').first  # @ 以前の部分を取得
      else
        'ユーザー情報がありません'
      end
    end
  end

  def show
    if @post.nil?
      flash[:alert] = "投稿が見つかりません"
      redirect_to posts_path
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user # 投稿者を現在のユーザーに設定

    if @post.save
      redirect_to @post, notice: '投稿が成功しました。'
    else
      render :new
    end
  end

  def edit
    # @postはbefore_actionで設定済み
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '投稿が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿が削除されました。'
    redirect_to posts_path, status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :deadline)
  end
end
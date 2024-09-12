class TasksController < ApplicationController
  before_action :set_post
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = @post.tasks
  end

  def show
    @task = Task.find(params[:id])
    @post = @task.post
    @comments = @task.comments # コメントをロード
    @comment = @task.comments.new # 新しいコメント用
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: 'Task not found.'
  end

  def new
    @task = @post.tasks.new
  end

  def create
    @task = @post.tasks.new(task_params)
    @task.user = current_user  # 現在のログインユーザーを紐付ける

    if @task.save
      redirect_to @post, notice: "Task was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to post_task_path(@post, @task), notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to post_tasks_path(@post), notice: "Task was successfully destroyed."
  end

  def create_comment
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_task_path(@post, @task), notice: 'Comment was successfully created.'
    else
      render :show
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_task
    @task = @post.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :content, :image)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

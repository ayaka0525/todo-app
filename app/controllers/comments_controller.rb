class CommentsController < ApplicationController
  before_action :set_task

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    @comment.post_id = @task.post.id  # post_id を設定

    if @comment.save
      redirect_to post_task_path(@task.post, @task), notice: 'Comment was successfully created.'
    else
      render 'tasks/show'
    end
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

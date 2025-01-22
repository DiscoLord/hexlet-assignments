class Posts::CommentsController < ApplicationController
  before_action :set_post, only: %i[ new create ]
  before_action :set_comment, only: %i[edit update destroy]

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      @comments = @post.comments
      flash.now[:alert] = 'Не удалось добавить комментарий.'
      render :edit
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to posts_path, notice: 'Комментарий успешно обновлен.'
    else
      flash.now[:alert] = 'Не удалось обновить комментарий.'
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_path, notice: 'Комментарий удален.'
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = PostComment.find(params[:id])
    end

    def comment_params
      params.require(:post_comment).permit(:content)
    end
end

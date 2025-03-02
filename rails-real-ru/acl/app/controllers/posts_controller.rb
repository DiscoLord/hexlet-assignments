# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    authorize Post
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Пост успешно создан.'
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'Пост обновлен.'
    else
      render :edit
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path, notice: 'Пост удален.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
  # END
end

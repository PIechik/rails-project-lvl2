# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  helper_method :resource_post

  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    authorize resource_post
    @comment = PostComment.new
  end

  def new
    @post = current_user.posts.build
    authorize @post
  end

  def create
    @post = current_user.posts.build(post_params)
    authorize @post

    if @post.save
      redirect_to root_path, notice: t('posts.notice.create')
    else
      render :new
    end
  end

  def edit
    authorize resource_post
  end

  def update
    authorize resource_post

    if resource_post.update(post_params)
      redirect_to resource_post, notice: t('posts.notice.update')
    else
      render :edit
    end
  end

  def destroy
    authorize resource_post
    if resource_post.destroy
      redirect_to posts_path, notice: t('posts.notice.destroy')
    else
      redirect_to resource_post
    end
  end

  private

  def resource_post
    @resource_post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end

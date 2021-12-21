# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
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
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    if @post.destroy
      redirect_to posts_path, notice: 'Post was successfully destroyed'
    else
      redirect_to @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end

# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      @post = Post.find(params[:post_id])
      @like = @post.likes.build(user_id: current_user.id)
      redirect_to @post if @like.save
    end

    def destroy
      @post = Post.find(params[:post_id])
      @like = Post::Like.find_by(user_id: current_user.id, post_id: @post.id)
      redirect_to @post if @like.destroy
    end
  end
end

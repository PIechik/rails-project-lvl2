# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      redirect_to @post if @comment.save
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :ancestry).merge(user_id: current_user.id)
    end
  end
end

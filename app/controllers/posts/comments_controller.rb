# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      authorize @comment
      redirect_to @post if @comment.save
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :ancestry).merge(user_id: current_user.id)
    end
  end
end

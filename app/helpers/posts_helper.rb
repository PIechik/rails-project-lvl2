# frozen_string_literal: true

module PostsHelper
  def user_liked_post?(post)
    PostLike.find_by(user_id: current_user&.id, post_id: post.id)
  end
end

# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:two)
    sign_in @user
  end

  test 'can like post' do
    post = posts(:two)
    post post_likes_path(post)

    like = post.likes.find_by(user_id: @user.id)
    assert { like }
  end

  test 'can remove like from post' do
    post = posts(:one)
    like = post_likes(:two)

    delete post_like_path(post, like)

    assert { !post.likes.find_by(id: like.id) }
  end
end

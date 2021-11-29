# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'can create new comment' do
    sign_in users(:one)
    assert_difference('PostComment.count') do
      post post_comments_path(posts(:two)), params: { post_comment: { content: 'Text', ancestry: nil } }
    end

    assert_redirected_to post_path(posts(:two))
    follow_redirect!
    assert_select 'p', 'Text'
  end
end

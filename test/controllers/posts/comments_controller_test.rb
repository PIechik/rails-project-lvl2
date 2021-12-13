# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'can create new comment' do
    sign_in users(:one)

    post = posts(:two)
    attrs = { content: Faker::Lorem.sentence, ancestry: nil }

    post post_comments_path(post), params: { post_comment: attrs }

    comment = post.comments.find_by(attrs)
    assert { comment }
    assert_redirected_to post_path(post)
  end
end

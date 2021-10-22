# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'can open index page' do
    get posts_path

    assert_response :success
    assert_select 'h2', posts(:one).title
    assert_select 'h2', posts(:two).title
  end

  test 'can show post' do
    get post_path(posts(:one))

    assert_response :success
    assert_select 'h2', posts(:one).title
  end

  test 'can create new post' do
    sign_in users(:one)
    get new_post_path
    assert_response :success

    assert_difference 'Post.count' do
      post posts_path, params: { post: { title: 'Title', body: 'Body', category_id: categories(:one).id } }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h2', 'Title'
  end
end

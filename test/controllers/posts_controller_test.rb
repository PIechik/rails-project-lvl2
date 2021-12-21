# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'can open index page' do
    get posts_path

    assert_response :success
    assert_select 'h2', posts(:one).title
    assert_select 'h2', posts(:two).title
  end

  test 'can open index page for unauthenticated user' do
    sign_out @user
    get posts_path

    assert_response :success
    assert_select 'h2', posts(:one).title
    assert_select 'h2', posts(:two).title
  end

  test 'can show post' do
    get post_path(posts(:one))

    assert_response :success
    assert_select 'h2', posts(:one).title
    assert_select 'p', post_comments(:one).content
  end

  test 'can show post to unauthenticated user' do
    sign_out @user
    get post_path(posts(:one))

    assert_response :success
    assert_select 'h2', posts(:one).title
    assert_select 'p', post_comments(:one).content
  end

  test 'can create new post' do
    get new_post_path
    assert_response :success

    attrs = { title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph_by_chars(number: 250),
              post_category_id: post_categories(:one).id }
    post posts_path, params: { post: attrs }

    assert { Post.find_by(attrs) }
    assert_response :redirect
    follow_redirect!
    assert_select 'h2', attrs[:title]
  end

  test 'can open edit page' do
    get edit_post_path(posts(:one))
    assert_response :success
  end

  test 'can update post' do
    post = posts(:one)
    attrs = { title: Faker::Lorem.sentence }

    patch post_path(post), params: { post: attrs }
    assert_response :redirect

    post.reload

    assert { post.title == attrs[:title] }
  end

  test 'can destroy post' do
    post = posts(:one)

    delete post_path(post)
    assert_response :redirect

    assert { !Post.find_by(id: post.id) }
  end
end

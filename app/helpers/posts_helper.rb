# frozen_string_literal: true

module PostsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render('posts/comments/comment', comment: comment) +
        content_tag(:div, class: 'ms-4') { nested_comments(sub_comments) }
    end.join.html_safe
  end
end

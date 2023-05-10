class CommentsController < ApplicationController
  def create
    the_comment = Comment.new
    the_comment.content = params.fetch("query_content")
    the_comment.post_id = params.fetch("query_post_id")
    the_comment.user_id = params.fetch("query_user_id")

    if the_comment.valid?
      the_comment.save
      redirect_to("/comments", { :notice => "Comment created successfully." })
    else
      redirect_to("/comments", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.content = params.fetch("query_content")
    the_comment.post_id = params.fetch("query_post_id")
    the_comment.user_id = params.fetch("query_user_id")

    if the_comment.valid?
      the_comment.save
      redirect_to("/comments/#{the_comment.id}", { :notice => "Comment updated successfully." })
    else
      redirect_to("/comments/#{the_comment.id}", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.destroy

    redirect_to("/comments", { :notice => "Comment deleted successfully." })
  end
end

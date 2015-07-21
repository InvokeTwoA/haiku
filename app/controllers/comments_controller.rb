class CommentsController < ApplicationController

  def create
    comment = Comment.create!(comment_params)
    haiku_set = comment.haiku_set
    haiku_set.comments_num = haiku_set.comments_num+1
    haiku_set.save!
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :body, :haiku_set_id)
  end
end

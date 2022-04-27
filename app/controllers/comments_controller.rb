class CommentsController < ApplicationController

  def create
    photo = Photo.find(params[:photo_id])
    comment = current_user.comments.new(comment_params)
    comment.photo_id = photo.id
    comment.save
    redirect_to photo_path(photo)
  end

  def destroy
    photo = Photo.find(params[:photo_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to photo_path(photo)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :photo_id, :user_id)
  end

end

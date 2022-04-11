class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    if comment.valid?
      render json: comment
    else 
      render json: comment.errors, status: 422
    end
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    if comment.valid?
      render json: comment
    else 
      render json: comment.errors, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      render json: comment
    else
      render json: comment.errors, status: 422
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:review, :dog_id)
  end
end

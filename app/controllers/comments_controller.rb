class CommentsController < ApplicationController

  def create
    # Get the post the comment goes with
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(post_params)

    redirect_to post_path(@post)
  end

  def destroy

    @post = Post.find(params[:post_id])

    @comment = @post.comments.find(params[:id])

    @comment.destroy

    redirect_to post_path(@post)
  end

  private


  def post_params
    params.require(:comment).permit(:name, :body)
  end
end

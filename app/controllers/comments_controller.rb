class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def create

    @blog = Blog.find( params[:blog_id])
    @blog.comments.create(comment_params)
    @blog.save


    redirect_to blog_path(@blog)

    @comment = Comment.new(comment_params)

  end

  def destroy

    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy

    redirect_to blog_path(@blog)

  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:author, :content, :avatar_url, :rating, :blog_id)
    end
end

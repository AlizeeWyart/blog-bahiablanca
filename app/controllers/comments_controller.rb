class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @is_user = User.find_by_email(params[:email])
    @article = @comment.article
    if @is_user.nil?
      @user = User.new(email: params[:email], first_name: params[:first_name])
    else
      @is_user.update(email: params[:email], first_name: params[:first_name])
      @user = User.find(@is_user.id)
    end
    @comment.user = @user
    if @comment.save
       redirect_to article_path(@article)
    else
       redirect_to article_path(@article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:email, :user, :first_name, :last_name, :title, :content, :article_id)
  end
end

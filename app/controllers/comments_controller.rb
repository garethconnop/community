class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id if current_user
    @comment.save

  	if @comment.save
      # For notifications
      @comment.send_notifications!
      
      redirect_to post_path(@post, anchor: "comment_#{@comment.id}")
  	else
  	  redirect_to post_path(@post), alert: 'Unable to save your post.'
    end
  end

  def edit
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])

  	if @comment.update(params[:comment].permit(:comment))
  	  redirect_to post_path(@post, anchor: "comment_#{@comment.id}")
  	else
  	  render 'edit'
  	end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end

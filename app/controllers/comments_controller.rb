class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment= @post.comments.create(comment_params)
		redirect_to post_path(@post)


		# @comment = @post.comments.new

		# if @comment.save
		# 	redirect_to post_path(@post)
			
		# else
		# 	render "/posts/#{params[:post_id]}/comments/new"

		# end

		
		
	end
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
		
	end


	 private
    def comment_params
      params.require(:comment).permit(:name, :body)
    end


end

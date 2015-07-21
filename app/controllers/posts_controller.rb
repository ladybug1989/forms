class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@post = Post.all.order("created_at DESC")
	end 
	def show 
	end 

	def new
    @post = current_user.posts.build
	end 

	def create
		@post = current_user.posts.build (post_params)

		#if the post is able to be saved if not you wil be directd back to the new post submission.

		if @post.save 
			redirect_to @post
		else 
			render 'new'
		end 

	end 

	def edit
	end 

	def update
		if @post.update(post_params)
			redirect_to @post
		else 
			render 'edit'
		end 
	end 

	def destroy
		@post.destroy
		redirect_to root_path 
	end 
	
	private

	def find_post
		@post = Post.find(params[:id])
	end 

  def post_params 
  	params.require(:post).permit(:title,:content)
  end

end

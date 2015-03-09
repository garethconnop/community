class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  #remove above exceptions once user account and replacement home page setup

	def index
		if params[:category].blank?
		  @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
		else
			@category_id = Category.find_by(name: params[:category]).id
			@posts = Post.where(category_id: @category_id).order("created_at DESC").paginate(page: params[:page], per_page: 10)
		end
	end

	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

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
		params.require(:post).permit(:title, :content, :category_id)
	end
end

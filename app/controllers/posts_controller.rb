class PostsController < ApplicationController
  
  #before_action :require_seller, except: [:show]
  before_action :require_admin, except: [:show]

  def index
    @post = Post.all
  end

  def new
	  @post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  	  flash[:success] = "Post was successfully created"
  	   redirect_to post_path(@post)
  	else
  	  render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_listings = @post.listings
  end 

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render 'edit'
      end
  end  
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  def post_params
  	params.require(:post).permit(:title, :description, :image, category_ids:[])
  end 
end
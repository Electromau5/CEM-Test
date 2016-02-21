class CategoriesController < ApplicationController

before_action :set_category, only: [:edit, :update, :show, :destroy]
before_action :require_admin, except: [:index, :show]

	def index
		@category = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(c_params)
		if @category.save
			redirect_to category_path(@category)
		else
			render 'new'
		end	
	end

	def edit
	end

	def update
		if @category.update(c_params)
			redirect_to category_path(@category)
		else
			render 'edit'
		end
	end

	def show
		@list = Category.all
		@category_posts = @category.posts
	end

	def destroy
		@category.destroy
		redirect_to categories_path
	end

private
	def c_params
		params.require(:category).permit(:name)
	end

	def set_category
		@category = Category.find(params[:id])
	end
end
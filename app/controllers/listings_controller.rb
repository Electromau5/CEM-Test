class ListingsController < ApplicationController
    
    #execute in same order
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :require_seller, only: [:show, :edit, :update, :destroy]
    before_action :require_same_seller, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:index]
	def index
		@listing = Listing.all
	end

	def new
		@listing = Listing.new
    end

    def create
    	@listing = Listing.new(listing_params)
        @listing.seller = current_seller
    	if @listing.save
    		redirect_to listing_path(@listing)
    	else
    		render 'new'
    	end
    end

    def edit
    end

    def update
        if @listing.update(listing_params)
    		redirect_to listing_path(@listing)
    	else 
    		render 'edit'
    	end
    end

    def show
         @listing_seller = @listing.seller
         @listing_posts = @listing.posts
    end

    def destroy
        @listing.destroy
        redirect_to listings_path
    end

    private
    def listing_params
       params.require(:listing).permit(:name, :description, :image, :location, :price, :condition)
    end

    def set_listing
        @listing = Listing.find(params[:id])
    end
end
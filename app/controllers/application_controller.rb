class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_seller, :logged_in?

  def current_seller
  	@current_seller ||= Seller.find(session[:seller_id]) if session[:seller_id]
  end

  def logged_in?
  	#!current_seller.nil?
    !!current_seller
  end

  def require_seller
  	if !logged_in?
      flash[:notice] = "You need to be an active seller to make changes to a seller's account"
      redirect_to root_path
  	end
  end
  
  def require_same_seller
        if current_seller != @listing.seller && !current_seller.admin?
            redirect_to root_path
        end
  end

  def require_admin
      if (logged_in? && !current_seller.admin) || (!logged_in?)
        redirect_to root_path
      end
    end
  end 
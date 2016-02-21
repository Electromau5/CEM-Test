class SessionsController < ApplicationController

def new
end

def create
	seller = Seller.find_by(email: params[:session][:email].downcase)
	if seller && seller.authenticate(params[:session][:password])
		#session[:seller_id] places a temporary cookie on the browser window which ends when the browser is closed
		session[:seller_id] = seller.id
		flash[:success] = 'You have successfully logged in'
		redirect_to categories_path
	else
		render 'new'
	end
end

def destroy
	session[:seller_id] = nil
	flash[:success] = 'You have successfully logged out'
	redirect_to categories_path
end

end
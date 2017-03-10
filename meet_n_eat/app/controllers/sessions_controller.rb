class SessionsController < ApplicationController

	def new
		@account = Account.new
	end

	def create
		if params[:username] && !params[:username].empty?
			session[:username] = param[:username]
			redirect_to account_path(@account)
		else
			flash[:error] = "Please Enter a Valid Username and Password"
			redirect_to root_path
		end
	end

	def destroy
		session.delete(:username)
	end

end
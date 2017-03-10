class SessionsController < ApplicationController

	def new
		@account = Account.new
	end

	def create
		if params[:username] && !params[:username].empty?
			session[:username] = param[:username]
			redirect_to account_path(@account)
		else
			flash[:error] = "Your Username or Password is not valid. If you do not have an account, please signup to find dinner buddies!"
			redirect_to signin_path
		end
	end

	def destroy
		session.delete(:username)
	end

end
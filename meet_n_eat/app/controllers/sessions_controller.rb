class SessionsController < ApplicationController

	def new
		@account = Account.new
	end

	def create
		account = Account.find_by(username: params[:account][:username])
		if (account && account.authenticate(params[:account][:password])) 
			session[:account_id] = account.id
			redirect_to account_path(account)
		else
			flash[:error] = "Your Username or Password is not valid. If you do not have an account, please signup to find dinner buddies!"
			redirect_to signin_path
		end
	end

	def destroy
		session.delete(:account_id)
		redirect_to signin_path
	end

end
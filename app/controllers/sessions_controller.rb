class SessionsController < ApplicationController

	def new
		@account = Account.new
	end

	def create
		account = Account.find_by(username: params[:account][:username])
		if (account && account.authenticate(params[:account][:password])) 
			session[:account_id] = account.id
			flash[:message] = "Successfully logged in as #{current_account.username}."
			redirect_to root_path
		else
			flash[:error] = "Your Username or Password is not valid. If you do not have an account, please signup to find dinner buddies!"
			redirect_to signin_path
		end
	end
	
	def destroy
		log_out()
    	redirect_to signin_path
	end
end
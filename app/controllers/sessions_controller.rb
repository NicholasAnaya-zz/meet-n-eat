class SessionsController < ApplicationController

	def new
		@account = Account.new
	end

	def create
		if request.env['omniauth.auth']
			user = Account.create_with_omniauth(request.env['omniauth.auth'])
			session[:account_id] = user.id
			redirect_to root_path
		else
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
	end

	def destroy
		log_out()
    	redirect_to signin_path
	end
end

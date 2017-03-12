class AccountsController < ApplicationController
	before_action :account_logged_in, only: [:show, :edit, :update, :destroy]
	before_action :check_if_own_page, only: [:edit, :update, :destroy]

	def show
		@account = Account.find(params[:id])
	end

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(account_params)
		if @account.valid?
			@account.save
			redirect_to account_path(@account)
		else
			flash[:error] = "Please try again"
			redirect_to new_account_path
		end
	end

	def edit

	end

	def update

	end

	def destroy

	end

	private

	def logged_in?
		return !!session[:account_id]		
	end

	def account_logged_in
		unless logged_in?
			flash[:message] = "Please log in to view this page."
			redirect_to signin_path
		end
	end

	def check_if_own_page
		unless session[:account_id] === params[:id].to_i
			flash[:message] = "Sorry, you do not have permission to do that."
			redirect_to account_path(Account.find(session[:account_id]))
		end
	end

	def account_params
		params.require(:account).permit(:username, :password, :email, :first_name, :last_name)
	end
end

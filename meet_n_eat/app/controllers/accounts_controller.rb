class AccountsController < ApplicationController

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

	private

	def account_params
		params.require(:account).permit(:username, :password_digest, :email, :first_name, :last_name)
	end
end

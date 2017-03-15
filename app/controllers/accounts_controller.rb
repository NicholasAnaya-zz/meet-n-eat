class AccountsController < ApplicationController
	before_action :account_logged_in, only: [:show, :edit, :update, :destroy]
	before_action :check_if_own_page, only: [:edit, :update, :destroy]

	def show
		@account = Account.find(params[:id])
	end

	def new
		@account = Account.new
	end

	def edit
		@account = Account.find(params[:id])
	end

	def create
		@account = Account.new(account_params)
		if @account.valid?
			@account.save
			log_in(@account)
			redirect_to account_path(@account)
		else
			# if @account.first_name.valid? == false
			# 	flash[:error] = "Your First Name is Invalid"
			# elsif @account.last_name.valid? == false
			# 	flash[:error] = "Your Last Name is Invalid"
			# elsif @account.username.valid? == false
			# 	flash[:error] = "Your Username is Invalid"
			# elsif @account.password.valid? == false
			# 	flash[:error] = "Your Password is Invalid"
			render :new
		end
	end

	def update
		account = Account.find(params[:id])
		if account.update(account_edit_params)
			redirect_to account_path(account)
		else
			flash[:error] = "Update is invalid"
			redirect_to edit_account_path(account)
		end
	end

	def destroy
		account = Account.find(params[:id])
		log_out
		account.created_events.each { |event| event.destroy }
		account.attended_events.each { |event| event.guests.delete(account) }
		account.delete
		flash[:message] = "Successfully deleted account"
		redirect_to root_path
	end

	



	private

	def check_if_own_page
		unless session[:account_id] === params[:id].to_i
			flash[:message] = "Sorry, you do not have permission to do that."
			redirect_to account_path(Account.find(session[:account_id]))
		end
	end

	def account_params
		params.require(:account).permit(:username, :password, :email, :first_name, :last_name)
	end

	def account_edit_params
		params.require(:account).permit(:biography, :favorite_food)
	end
end

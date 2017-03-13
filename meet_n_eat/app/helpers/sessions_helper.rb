module SessionsHelper

  def current_account=(account)
    @current_account = accounts
  end

  def current_account
     @current_account ||= Account.find_by(id: session[:account_id])
  end

  def logged_in?
    !!session[:account_id]
  end

  def account_logged_in
		unless logged_in?
      flash[:message] = "Please log in to view this page."
      redirect_to signin_path
		end
	end

  def log_out
    session.delete(:account_id)
  end
end

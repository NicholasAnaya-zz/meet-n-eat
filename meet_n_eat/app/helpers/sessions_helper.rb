module SessionsHelper

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
    session.delete(:id)
  end
end
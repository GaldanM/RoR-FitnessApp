class SessionsController < ApplicationController

  # GET /admin_login

  def new
    return unless current_admin
    redirect_to root_path
  end

  # GET /admin_logout

  def delete
    log_out
    redirect_to root_path
  end

  # POST /admin_login

  def create
    admin = Admin.find_by(login: params[:formSession][:login].downcase)
    if admin && admin.authenticate(params[:formSession][:password])
      log_in admin
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid login/password combination'
      render 'new'
    end
  end

end

class AccessController < ApplicationController

  before_action :confirm_logged_in,
    :except => [:login, :attempt_login, :logout]

  def index
    
  end

  def login
  
  end
  
  def attempt_login
    if params[:name].present? && params[:password].present?
        found_user = User.where(:name => params[:name]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:name] = authorized_user.name
      redirect_to(:controller => 'number_set', :action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:name] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end
  
end

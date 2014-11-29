class EmailController < ApplicationController

  def create
    @email = Email.new(email_params)
    @email.save
    redirect_to(:controller => 'number_set', :action => 'index')  
  end
  
  def destroy
    Email.find(params[:id]).destroy
    redirect_to(:controller => 'number_set', :action => 'index')
  end

  private
  
  def email_params
     params.require(:email).permit(:email, :number_set_id) 
  end


end
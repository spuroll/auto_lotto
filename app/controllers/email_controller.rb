class EmailController < ApplicationController

  def create
  
  end
  
  def destroy
    Email.find(params[:id]).destroy
    redirect_to(:controller => 'number_set', :action => 'index')
  end

end
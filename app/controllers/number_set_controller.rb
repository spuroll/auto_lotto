class NumberSetController < ApplicationController

  before_action :confirm_logged_in

  def index
    @nevada_now = DateTime.now - 8.hours
    sets = NumberSet.all
    @active_sets = Array.new
    
    sets.each do |set|
      if set.check_date >= @nevada_now.to_date && set.user_id == session[:user_id]
        @active_sets << set
      end 
    end
  end

  def show
    @set = NumberSet.find(params[:id])
  end
  
  def expired
    @nevada_now = DateTime.now - 8.hours
    sets = NumberSet.all
    @expired_sets = Array.new
    
    sets.each do |set|
      if set.check_date < @nevada_now.to_date && set.user_id == session[:user_id]
        @expired_sets << set
      end
    end
  end

  def new
    @set = NumberSet.new
  end
  
  def create
    @id ||= session[:user_id]
    @number_set = NumberSet.new(number_params)
    @user = User.find(@id)
      if @number_set.save
        @user.number_sets << @number_set
        redirect_to(:action => 'index')
      else
        flash[:notice] = "Please ensure you've entered values in the correct formats."
        render('new')
      end
  end

  def edit
    @number_set = NumberSet.find(params[:id])
  end
  
  def update
    @number_set = NumberSet.find(params[:id])
    if @number_set.update_attributes(number_params)
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def destroy
    NumberSet.find(params[:id]).destroy
    redirect_to :back
  end
  
  def number_params 
    params.require(:number_set).permit(:set, :check_date)
  end
  
end

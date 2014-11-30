class NumberSetController < ApplicationController
  def index
    @sets = NumberSet.all
  end

  def show
    @set = NumberSet.find(params[:id])
  end

  def new
    @set = NumberSet.new
  end
  
  def create
    @number_set = NumberSet.new(number_params)
    @number_set.fresh = true
    @user = User.find(2)
      if @number_set.save
        @user.number_sets << @number_set
        redirect_to(:action => 'index')
      else
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
    redirect_to(:action => 'index')
    
  end
  
  def number_params 
    params.require(:number_set).permit(:set)
  end
  
end

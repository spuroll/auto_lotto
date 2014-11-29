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
    @user = User.find(1)
      if @number_set.save
        @user.number_sets << @number_set
        redirect_to @number_set
      else
        render('new')
      end

  end

  def edit
    @set = NumberSet.find(params[:id])
  end

  def delete
    @set = NumberSet.find(params[:id])
  end
  
  def number_params 
    params.require(:number_set).permit(:set)
  end
  
end

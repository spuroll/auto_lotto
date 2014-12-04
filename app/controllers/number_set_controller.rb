class NumberSetController < ApplicationController

  before_action :confirm_logged_in

  def index
    @nevada_now = DateTime.now - 8.hours
    sets = NumberSet.all
    @active_sets = Array.new
    
    sets.each do |set|
      if set.check_date >= @nevada_now.to_date
        @active_sets << set
      end 
    end

  require 'open-uri'
  file = open('http://www.megamillions.com/winning-numbers')
  contents = file.read
  contents.to_s
  startparse = contents.index('<div class="ball white">') + 22
  endparse = contents.index('<div class="ball gold">') + 30
  substring = contents[startparse..endparse]
  
  start_array = Array.new
  
  substring.to_enum(:scan,/">/).map do |m,|
      start_array << [$`.size,m]
  end
  
  start_one = start_array[0][0] + 2
  start_two = start_array[1][0] + 2
  start_three = start_array[2][0] + 2
  start_four = start_array[3][0] + 2
  start_five = start_array[4][0] + 2
  start_six = start_array[5][0] + 2
  
  end_array = Array.new
  substring.to_enum(:scan,/<\/div>/).map do |m,|
      end_array << [$`.size,m]
  end
  
  end_one = end_array[0][0] -1
  end_two = end_array[1][0] -1
  end_three = end_array[2][0] -1
  end_four = end_array[3][0] -1
  end_five = end_array[4][0] -1
  end_six = end_array[5][0] -1
  
  num_one = substring[start_one..end_one]
  num_two = substring[start_two..end_two]
  num_three = substring[start_three..end_three]
  num_four = substring[start_four..end_four]
  num_five = substring[start_five..end_five]
  num_six = substring[start_six..end_six]
  
  @last_draw = "#{num_one} #{num_two} #{num_three} #{num_four} #{num_five} #{num_six}"
      
  end

  def show
    
    @set = NumberSet.find(params[:id])
    
  end
  
  def expired
    @nevada_now = DateTime.now - 8.hours
    sets = NumberSet.all
    @expired_sets = Array.new
    
    sets.each do |set|
      if set.check_date < @nevada_now.to_date
        @expired_sets << set
      end
    end
  end

  def new
    @set = NumberSet.new
  end
  
  def create
    @id = session[:user_id]
    @number_set = NumberSet.new(number_params)
    @number_set.fresh = true
    @user = User.find(@id)
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
    params.require(:number_set).permit(:set, :check_date)
  end
  
end

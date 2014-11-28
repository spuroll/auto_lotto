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

  def edit
    @set = NumberSet.find(params[:id])
  end

  def delete
    @set = NumberSet.find(params[:id])
  end
end

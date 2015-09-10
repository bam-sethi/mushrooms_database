class MushroomsController < ApplicationController
protect_from_forgery

  def index
    @mushrooms = Mushroom.all
  end

  def new
    @mushroom = Mushroom.new
    # binding.pry
  end

  def create
    # binding.pry
    @mushroom = Mushroom.new(name: params[:mushroom]['name'], properties: params[:mushroom]['properties'], image: params[:mushroom]['image'])
    if @mushroom.save
      redirect_to("/mushrooms/#{@mushroom[:id]}")
    else
      redirect_to(:"/mushrooms/new")
    end
  end


  def show
    @mushroom = Mushroom.find(params[:id])
  end

  def edit 
    @mushroom = Mushroom.find(params[:id])
  end

  def update
    @mushroom = Mushroom.find(params[:id])
    if @mushroom.update_attributes(name: params[:mushroom]['name'], properties: params[:mushroom]['properties'], image: params[:mushroom]['image'])
      redirect_to("/mushrooms/#{@mushroom[:id]}")
    else
      redirect_to(:"/mushrooms/edit")
    end
  end

  def destroy
    @mushroom = Mushroom.find(params[:id])
    if @mushroom.destroy
      redirect_to("/mushrooms")
    else
      redirect_to("/mushrooms/#{@mushroom[:id]}")
    end
  end






end

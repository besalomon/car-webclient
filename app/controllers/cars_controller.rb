class CarsController < ApplicationController

  def show
    @car = Car.find(params[:id])
  end

   def index
    @cars = Car.all
  end

  def new

  end

  def create
    @car = Car.create(params[:name], params[:model], params[:manufacturer])
    redirect_to "/cars/#{@car['id']}"
  end

  def destroy
    Car.delete(params[:id])
    redirect_to "/cars"
  end

  def edit
    @car = Unirest.get("http://localhost:3000/api/v1/cars/#{params[:id]}.json").body
  end

  def update
    Car.update(params[:id], params[:name], params[:model], params[:manufacturer])
     redirect_to "/cars/#{params[:id]}"
  end

end 

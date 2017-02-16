class CarsController < ApplicationController
  def index
    @cars = Unirest.get("http://localhost:3000/api/v1/cars.json").body
  end

  def show
    @car = Unirest.get("http://localhost:3000/api/v1/cars/#{params[:id]}.json").body
    render :show
  end

end

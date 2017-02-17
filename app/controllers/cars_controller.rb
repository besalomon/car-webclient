class CarsController < ApplicationController

  def show
    @car = Unirest.get("http://localhost:3000/api/v1/cars/#{params[:id]}.json").body
    render :show
  end

   def index
    @cars = Unirest.get("http://localhost:3000/api/v1/cars.json").body
  end

  def new

  end

  def create
     @car = Unirest.post("http://localhost:3000/api/v1/cars.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :model => params[:model], :manufacturer=> params[:manufacturer]}).body
     redirect_to "/cars/#{@car['id']}"
  end

  def destroy
    @car = Unirest.delete("http://localhost:3000/api/v1/cars/#{params[:id]}.json").body
    redirect_to "/cars"
  end

  def edit
    @car = Unirest.get("http://localhost:3000/api/v1/cars/#{params[:id]}.json").body
  end

  def update
    @car = Unirest.patch("http://localhost:3000/api/v1/cars/#{params[:id]}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :model => params[:model], :manufacturer=> params[:manufacturer]}).body
     redirect_to "/cars/#{@car['id']}"
  end

end 

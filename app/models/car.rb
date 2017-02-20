class Car
  attr_accessor :id, :name, :model, :speed, :manufacturer

  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @model = hash['model']
    @speed = hash['speed']
    @manufacturer = hash['manufacturer']
  end

  def self.find(id)
    car_hash = Unirest.get("http://localhost:3000/api/v1/cars/#{id}.json").body
    Car.new(car_hash)
  end

  def self.all
    cars = Unirest.get("http://localhost:3000/api/v1/cars").body

    @cars = []

    cars.each do |assign|
      @cars << Car.new(assign)
    end
    return @cars

  end

   def self.delete(id)
      Unirest.delete("http://localhost:3000/api/v1/cars/#{id}.json").body
    end

    def self.update(id, name, model, manufacturer)
      Unirest.patch("http://localhost:3000/api/v1/cars/#{id}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => name, :model => model, :manufacturer=> manufacturer}).body
    end

    def self.create(name, model, manufacturer)

      Unirest.post("http://localhost:3000/api/v1/cars.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => name, :model => model, :manufacturer=> manufacturer}).body
    end
end

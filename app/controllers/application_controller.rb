class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/buses" do
    buses = Bus.all 
    buses.to_json
  end

  get "/trains" do
    trains = Train.all 
    trains.to_json
  end

  get "/buses/:id" do
    bus = Bus.find(params[:id])
    bus.to_json
  end

  get "/trains/:id" do
    train = Train.find(params[:id])
    train.to_json
  end

  post "/buses" do
    bus = Bus.create(bus_number:params[:bus_number], departure_city:params[:departure_city], destination_city:params[:destination_city], departure:params[:departure], arrival:params[:arrival], available_seats:params[:available_seats], fare:params[:fare])
    bus.to_json
  end

  post "/trains" do
    train = Train.create(train_number:params[:train_number], departure_city:params[:departure_city], destination_city:params[:destination_city], departure:params[:departure], arrival:params[:arrival], available_seats:params[:available_seats], fare:params[:fare])
    train.to_json
  end  
  end

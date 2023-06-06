class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  #get requests

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

  get "/customers" do
    customers = Customer.all
    customers.to_json
  end

  #get by id
  get "/buses/:id" do
    bus = Bus.find(params[:id])
    bus.to_json
  end

  get "/trains/:id" do
    train = Train.find(params[:id])
    train.to_json
  end

  get "/customers/:id" do
    customer = Customer.find(params[:id])
    customer.to_json
  end

  #post requests
  post "/buses" do
    bus = Bus.create(
      bus_number:params[:bus_number], 
      departure_city:params[:departure_city], 
      destination_city:params[:destination_city], 
      departure:params[:departure], 
      arrival:params[:arrival], 
      available_seats:params[:available_seats], 
      fare:params[:fare]
      )
    bus.to_json
  end

  post "/trains" do
    train = Train.create(
      train_number:params[:train_number], 
      departure_city:params[:departure_city], 
      destination_city:params[:destination_city], 
      departure:params[:departure], 
      arrival:params[:arrival], 
      available_seats:params[:available_seats], 
      fare:params[:fare]
    )
    train.to_json
  end 

  post "/customers" do
    customer = Customer.create(
      first_name:params[:first_name],
      last_name:params[:last_name],
      passport:params[:passport],
      phone_number:params[:phone_number],
      mode_of_payment:params[:mode_of_payment],
      departure_info:params[:departure_info]
    )
    customer.to_json
  end

  # patch requests
  patch '/buses/:id' do
    bus = Bus.find(params[:id])
    bus.update(
      bus_number:params[:bus_number], 
      departure_city:params[:departure_city], 
      destination_city:params[:destination_city], 
      departure:params[:departure], 
      arrival:params[:arrival], 
      available_seats:params[:available_seats], 
      fare:params[:fare]
    )
    bus.to_json
     end

     patch '/trains/:id' do
      train = Train.find(params[:id])
    train.update(
      train_number:params[:train_number], 
      departure_city:params[:departure_city], 
      destination_city:params[:destination_city], 
      departure:params[:departure], 
      arrival:params[:arrival], 
      available_seats:params[:available_seats], 
      fare:params[:fare]
    )
    train.to_json
     end

     patch '/customers/:id' do
      customer = Customer.find(params[:id])
      customer.update(
      first_name:params[:first_name],
       last_name:params[:last_name],
       passport:params[:passport],
       phone_number:params[:phone_number],
       mode_of_payment:params[:mode_of_payment],
       departure_info:params[:departure_info]
      )
      customer.to_json
     end

  end

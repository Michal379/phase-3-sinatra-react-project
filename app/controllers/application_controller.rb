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
end

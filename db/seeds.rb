puts "🌱 Seeding spices..."
# Bus Instances
departure_cities = ["Nairobi", "Mombasa", "Kisumu", "Busia", "Marsabit", "Eldoret","Kakamega","Voi"]
train_departure_cities = ["Nairobi","Mombasa","Suswa","Syokimau","Kisumu","Voi","Eldoret","Busia"]

20.times do
  fare = Faker::Number.between(from: 2000, to: 5000).round(-3)  # Round off to the nearest thousand
  departure_time = Faker::Time.between_dates(from: 3.days.from_now.to_date, to: 3.days.from_now.to_date + 1, period: :day).change(min: 0)  # Round off to the nearest hour
  arrival_time = Faker::Time.between_dates(from: 3.days.from_now.to_date + 1, to: 3.days.from_now.to_date + 2, period: :day).change(min: 0)  # Round off to the nearest hour

  bus_number = "0" + Faker::Number.unique.number(digits: 2).to_s  # Ensure bus_number starts with zero
  train_number =  Faker::Number.unique.number(digits: 3)
  Bus.create(
    bus_number: bus_number.to_i,
    departure_city: departure_cities.sample,
    destination_city: departure_cities.sample,
    departure: departure_time,
    arrival: arrival_time,
    available_seats: Faker::Number.between(from: 10, to: 50),
    fare: fare
  )
  Train.create(
     train_number: train_number,
    departure_city: train_departure_cities.sample,
    destination_city: train_departure_cities.sample,
    departure: departure_time,
    arrival: arrival_time,
    available_seats: Faker::Number.between(from: 70, to: 200),
    fare: fare
  )
  
end


puts "✅ Done seeding!"

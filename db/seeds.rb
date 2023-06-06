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
  $bus = Bus.create(
    bus_number: bus_number.to_i,
    departure_city: departure_cities.sample,
    destination_city: departure_cities.sample,
    departure: departure_time,
    arrival: arrival_time,
    available_seats: Faker::Number.between(from: 10, to: 50),
    fare: fare
  )

  $train = Train.create(
     train_number: train_number,
    departure_city: train_departure_cities.sample,
    destination_city: train_departure_cities.sample,
    departure: departure_time,
    arrival: arrival_time,
    available_seats: Faker::Number.between(from: 70, to: 200),
    fare: fare
  )  
end


18.times do
    first_names = ['John', 'Jane', 'David', 'Emily', 'Michael', 'Sarah', 'Robert', 'Olivia', 'Daniel', 'Sophia', 'Matthew', 'Isabella', 'Andrew', 'Ava', 'James', 'Mia', 'William', 'Emma']
  last_names = ['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor', 'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin', 'Thompson', 'Garcia']
  modes_of_payment= ['Mobile money', 'Credit card']
  departure_infos = ['bus_number 80', 'train_number 225', 'bus_number 55', 'train_number 370', 'bus_number 13', 'train_number 553', 'bus_number 40', 'train_number 703', 'bus_number 43', 'train_number 121']
   bus_number = $bus.bus_number
   train_number = $train.train_number


  bus_number = Bus.pluck(:bus_number).sample
  train_number = Train.pluck(:train_number).sample


    Customer.create(
      first_name: first_names.sample,
      last_name: last_names.sample,
      passport: rand(1_000_000_000..9_999_999_999), # Generate random 10-digit passport number
      phone_number: rand(1_000_000_000..9_999_999_999), # Generate random 10-digit phone number
      mode_of_payment: modes_of_payment.sample,
      departure_info: departure_infos.sample,
      bus_number_id: bus_number
    )


    Customer.create(
      first_name: first_names.sample,
      last_name: last_names.sample,
      passport: rand(1_000_000_000..9_999_999_999), # Generate random 10-digit passport number
      phone_number: rand(1_000_000_000..9_999_999_999), # Generate random 10-digit phone number
      mode_of_payment: modes_of_payment.sample,
      departure_info: departure_infos.sample,
      train_number_id: train_number
    )
  end


puts "✅ Done seeding!"

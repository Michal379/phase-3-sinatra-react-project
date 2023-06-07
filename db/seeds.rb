puts "🌱 Seeding spices..."
# Bus Instances
departure_cities = ["Nairobi", "Mombasa", "Kisumu", "Busia", "Marsabit", "Eldoret", "Kakamega", "Voi"]
train_departure_cities = ["Nairobi", "Mombasa", "Suswa", "Syokimau", "Kisumu", "Voi", "Eldoret", "Busia"]

20.times do
  fare = Faker::Number.between(from: 2000, to: 5000).round(-3)  # Round off to the nearest thousand
  departure_time = Faker::Time.between_dates(from: 3.days.from_now.to_date, to: 3.days.from_now.to_date + 1, period: :day).change(min: 0)  # Round off to the nearest hour
  arrival_time = Faker::Time.between_dates(from: 3.days.from_now.to_date + 1, to: 3.days.from_now.to_date + 2, period: :day).change(min: 0)  # Round off to the nearest hour

  bus_number = "0" + Faker::Number.unique.number(digits: 2).to_s  # Ensure bus_number starts with zero
  train_number = Faker::Number.unique.number(digits: 3)
  departure_city = departure_cities.sample
  destination_city = departure_cities.sample

  while destination_city == departure_city
    destination_city = departure_cities.sample
  end

  $bus = Bus.create(
    bus_number: bus_number.to_i,
    departure_city: departure_city,
    destination_city: destination_city,
    departure: departure_time,
    arrival: arrival_time,
    available_seats: Faker::Number.between(from: 10, to: 50),
    fare: fare
  )

  departure_city = train_departure_cities.sample
  destination_city = train_departure_cities.sample

  while destination_city == departure_city
    destination_city = train_departure_cities.sample
  end

  $train = Train.create(
    train_number: train_number,
    departure_city: departure_city,
    destination_city: destination_city,
    departure: departure_time,
    arrival: arrival_time,
    available_seats: Faker::Number.between(from: 70, to: 200),
    fare: fare
  )
end

first_names = ['John', 'Jane', 'David', 'Emily', 'Michael', 'Sarah', 'Robert', 'Olivia', 'Daniel', 'Sophia', 'Matthew', 'Isabella', 'Andrew', 'Ava', 'James', 'Mia', 'William', 'Emma', 'Zain', 'Juliet', 'Rivera', 'Tonnie', 'Lavender']
last_names = ['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor', 'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin', 'Thompson', 'Garcia', 'Malik', 'Reen', 'Andrea', 'Trisher', 'Lorena']
modes_of_payment = ['Mobile money', 'Credit card']

20.times do
  first_name = first_names.sample
  last_name = last_names.sample
  passport = rand(1_000_000_000..9_999_999_999) # Generate random 10-digit passport number
  phone_number = rand(1_000_000_000..9_999_999_999) # Generate random 10-digit phone number
  mode_of_payment = modes_of_payment.sample

  if rand < 0.5  # Randomly select bus or train
    bus_number = Bus.pluck(:bus_number).sample
    departure_info = "bus_number #{bus_number}"
    Customer.create(
      first_name: first_name,
      last_name: last_name,
      passport: passport,
      phone_number: phone_number,
      mode_of_payment: mode_of_payment,
      departure_info: departure_info,
      bus_number_id: bus_number
    )
  else
    train_number = Train.pluck(:train_number).sample
    departure_info = "train_number #{train_number}"
    Customer.create(
      first_name: first_name,
      last_name: last_name,
      passport: passport,
      phone_number: phone_number,
      mode_of_payment: mode_of_payment,
      departure_info: departure_info,
      train_number_id: train_number
    )
  end
end

puts "✅ Done seeding!"



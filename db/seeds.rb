# frozen_string_literal: true

p 'Start seeding 🚀'

p 'Parsing user data 👤'
user_data = YAML.safe_load(
  ERB.new(
    File.read(
      Rails.root.join('db/seed_data/users.yml')
    )
  ).result,
)
p 'Parsed user data 👤'

user_data.each do |data|
  user = User.create!(data)
  p "#{user.full_name} created 🗣"
end

[
  ['David', 'Oliver'],
  ['Alan', 'Bart'],
  ['Bart', 'Claudia']
].each do |firstnames|
  users = User.where(firstname: firstnames)
  users.first.send_invitation(users.last)
  p "#{users.first.firstname} => #{users.last.firstname} sent"
  users.last.accept_request(users.first)
  p "#{users.first.firstname} => #{users.last.firstname} accepted"
end

p 'Parsing cars data 🚙'
cars_data = YAML.safe_load(
  ERB.new(
    File.read(
      Rails.root.join('db/seed_data/cars.yml')
    )
  ).result,
)
p 'Parsed cars data 🚙'

cars_data.each do |data|
  header_image = data.delete('header_image')
  images = data.delete('images')

  car = Car.create!(data)
  p "#{car.type_name} created 🚙"

  header_image_name = "#{car.slug}-header.jpg"
  car.header_image.attach(
    io: File.open(header_image),
    filename: header_image_name,
    content_type: 'image/jpg'
  )
  p "#{header_image_name} uploaded 🌄"

  images.each_with_index do |image, index|
    image_filename = "#{car.slug}-#{index + 1}.jpg"
    car.images.attach(
      io: File.open(image),
      filename: image_filename,
      content_type: 'image/jpg'
    )
    p "#{image_filename} uploaded 🌄"
  end
end

p 'Seeding done 🚀'

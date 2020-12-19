# frozen_string_literal: true

user_data = YAML.safe_load(
  ERB.new(
    File.read(
      Rails.root.join('db/seed_data/users.yml')
    )
  ).result,
)

user_data.each do |data|
  user = User.create!(data)
  AvatarGenerator.call(user)
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
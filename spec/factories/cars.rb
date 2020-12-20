# frozen_string_literal: true

# == Schema Information
#
# Table name: cars
#
#  id                       :bigint           not null, primary key
#  body_style               :string
#  brand                    :string
#  car_grade_given_by_users :integer
#  city                     :string
#  country                  :string
#  engine                   :integer
#  fuel_type                :string
#  highlighted              :integer
#  mileage                  :string
#  number_plate             :string
#  postal_code              :integer
#  power                    :integer
#  price_per_day            :integer
#  propulsion               :string
#  seats                    :integer
#  slug                     :string
#  state                    :string
#  street                   :string
#  transmission             :string
#  type_name                :string           default(""), not null
#  year                     :integer
#  zipcode                  :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  user_id                  :bigint           not null
#
# Indexes
#
#  index_cars_on_slug       (slug) UNIQUE
#  index_cars_on_type_name  (type_name) UNIQUE
#  index_cars_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :car do
    owner
    body_style { 'Coupé' }
    car_grade_given_by_users { 4.5 }
    city { 'Bordeaux' }
    country { 'France' }
    engine { 6 }
    fuel_type { 'Essence' }
    highlighted { 10 }
    mileage { '20-50 000 km' }
    number_plate { 'AB-123-AB' }
    postal_code { 33_000 }
    power { 400 }
    price_per_day { 500 }
    propulsion { 'Propulsion' }
    seats { 2 }
    slug { 'ferrari-328-gts-1986-bordeaux' }
    state { 'Nouvelle Aquitaine' }
    street { '10 Rue du Ruby' }
    transmission { 'Manuelle' }
    brand { 'Ferrari' }
    type_name { '328 GTS' }
    year { 1986 }
    zipcode { 33_000 }
  end
end

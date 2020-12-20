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
require 'rails_helper'

RSpec.describe Car, type: :model do
  subject { build(:car) }

  it 'has a valid factory' do
    expect(build(:car)).to be_valid
  end

  it { is_expected.to belong_to(:owner).class_name('User').inverse_of(:cars) }

  it { is_expected.to validate_presence_of(:type_name) }
  it { is_expected.to validate_uniqueness_of(:type_name).case_insensitive }

  it 'generates a slug upon creation' do
    car = build(:car, slug: nil, brand: 'Ford', type_name: 'Mustang Mach 1', year: '1969', city: 'Bordeaux')
    expect { car.save }.to change(car, :slug).from(nil).to('ford-mustang-mach-1-1969-bordeaux')
  end
end

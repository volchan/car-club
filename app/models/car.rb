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
class Car < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id, inverse_of: :cars

  has_one_attached :header_image
  has_many_attached :images

  has_rich_text :description_user

  validates :type_name, presence: true, uniqueness: { case_sensitive: false }

  before_create :generate_slug, if: :new_record?

  private

  def generate_slug
    self.slug = "#{brand}-#{type_name}-#{year}-#{city}".parameterize
  end
end

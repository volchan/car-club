# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :year
      t.integer :seats
      t.integer :engine
      t.integer :power
      t.integer :price_per_day
      t.integer :postal_code
      t.integer :highlighted
      t.integer :car_grade_given_by_users
      t.string :transmission
      t.string :propulsion
      t.string :mileage
      t.string :body_style
      t.string :city
      t.string :zipcode
      t.string :country
      t.string :state
      t.string :street
      t.string :number_plate
      t.string :slug
      t.string :fuel_type
      t.string :brand
      t.string :type_name, null: false, default: ''

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cars, :type_name, unique: true
    add_index :cars, :slug, unique: true
  end
end

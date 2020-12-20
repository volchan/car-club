# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @members = User.order(:lastname).where.not(id: current_user.id)
    @last_cars = Car.order(created_at: :desc).limit(10)
  end
end

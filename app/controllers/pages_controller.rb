# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :fetch_members, only: %I[home]

  def home
    @last_cars = Car.order(created_at: :desc).limit(10)
  end
end

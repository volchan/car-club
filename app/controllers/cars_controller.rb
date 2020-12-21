# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :fetch_members, only: %I[show]
  
  def show
    authorize @car = Car.find_by(slug: params[:slug])
  end
end

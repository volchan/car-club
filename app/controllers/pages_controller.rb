# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @members = User.order(:lastname).where.not(id: current_user.id)
  end
end

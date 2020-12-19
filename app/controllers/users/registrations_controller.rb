# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # def create
    #   super { AvatarGenerator.call(resource) }
    # end
  end
end

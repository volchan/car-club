# frozen_string_literal: true

# Fixes rake annotate_routes not working on rails 6.1
task routes: :environment do
  require 'rails/commands/routes/routes_command'
  Rails.application.require_environment!
  cmd = Rails::Command::RoutesCommand.new
  cmd.perform
end

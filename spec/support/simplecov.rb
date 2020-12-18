# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/' # for rspec

  enable_coverage :branch
end

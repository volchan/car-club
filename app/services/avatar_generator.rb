# frozen_string_literal: true

require 'image_processing/mini_magick'

class AvatarGenerator
  attr_reader :user

  AVATAR_COLORS = { '#561B8D' => '#C8F7C5',
                    '#DFF0D8' => '#468847',
                    '#F0E68C' => '#550055',
                    '#C8C8C8' => '#551700',
                    '#CD594A' => '#FFFFFF' }.freeze
  def self.call(user)
    return if user.avatar.attached?

    new(user).call
  end

  def initialize(user)
    @user = user
  end

  def call
    generate_image
    user.avatar.attach(io: File.open('tmp/default.jpg'),
                       filename: "#{user.email.parameterize}-default.jpg",
                       content_type: 'image/jpg')
    clean
  end

  private

  def generate_image
    rand = rand 0..4
    MiniMagick::Tool::Convert.new do |image|
      image.size '200x200'
      image.gravity 'center'
      image.xc AVATAR_COLORS.keys[rand]
      image.pointsize 100
      image.fill AVATAR_COLORS.values[rand]
      image.draw "text 0,0 #{initial_letters}"
      image << 'tmp/default.jpg'
    end
  end

  def initial_letters
    user.firstname.chr.upcase + user.lastname.chr.upcase
  end

  def clean
    File.delete('tmp/default.jpg')
  end
end

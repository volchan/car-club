# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  firstname              :string           default(""), not null
#  lastname               :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :invitations,
           class_name: 'Friendship',
           dependent: :destroy,
           inverse_of: :user

  has_many :requests,
           class_name: 'Friendship',
           dependent: :destroy,
           foreign_key: 'friend_id',
           inverse_of: :friend

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: Devise.email_regexp }

  after_create :generate_default_avatar

  def friends
    ids = [
      *invitations.where(user_id: id, confirmed: true).pluck(:friend_id),
      *requests.where(friend_id: id, confirmed: true).pluck(:user_id),
    ]

    User.where(id: ids)
  end

  def friend_with?(user)
    Friendship.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  def accept_request(user)
    requests.pending.find_by(friend_id: id, user_id: user.id, confirmed: false).accept!
  end

  private

  def generate_default_avatar
    return if avatar.attached?

    AvatarGenerator.call(self)
  end
end

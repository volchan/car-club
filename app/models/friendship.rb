# frozen_string_literal: true

# == Schema Information
#
# Table name: friendships
#
#  id         :bigint           not null, primary key
#  confirmed  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :integer
#  user_id    :bigint           not null
#
# Indexes
#
#  index_friendships_on_user_id                (user_id)
#  index_friendships_on_user_id_and_friend_id  (user_id,friend_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', inverse_of: :requests

  validate :users_are_not_already_friends, on: :create

  scope :pending, -> { where(confirmed: false) }

  def self.confirmed_record?(id1, id2)
    find_invitation(id1, id2).present?
  end

  def self.find_invitation(id1, id2)
    find_by(user_id: id1, friend_id: id2, confirmed: true) ||
      find_by(user_id: id2, friend_id: id1, confirmed: true)
  end

  def accept!
    update(confirmed: true)
  end

  private

  def users_are_not_already_friends
    owner = self.class.exists?(user_id: friend_id, friend_id: user_id)
    friend = self.class.exists?(user_id: user_id, friend_id: friend_id)
    return errors.add(:user_id, 'Already friends!') if owner || friend

    true
  end
end

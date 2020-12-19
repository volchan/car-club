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
require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'has a valid factory' do
    expect(build(:friendship)).to be_valid
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:friend).class_name('User').inverse_of(:requests) }

  it "can't sent request to an already invited user" do
    first_user = create(:user)
    second_user = create(:user)
    first_user.send_invitation(second_user)

    expect(second_user.send_invitation(first_user)).not_to be_valid
  end
end

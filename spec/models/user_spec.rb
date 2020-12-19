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
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { subject }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it { is_expected.to validate_presence_of(:firstname) }
  it { is_expected.to validate_presence_of(:lastname) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  it { is_expected.to have_many(:invitations).class_name('Friendship').dependent(:destroy).inverse_of(:user) }

  it do
    expect(user).to(
      have_many(:requests)
        .class_name('Friendship')
        .dependent(:destroy)
        .with_foreign_key('friend_id')
        .inverse_of(:friend),
    )
  end

  it 'can send a friendship invite' do
    first_user = create(:user)
    second_user = create(:user)
    expect { first_user.send_invitation(second_user) }.to change(first_user.invitations, :length).by(1)
  end

  it 'can receive a friendship invite' do
    first_user = create(:user)
    second_user = create(:user)
    first_user.send_invitation(second_user)
    second_user.reload
    expect(second_user.requests.pending.length).to eq(1)
  end

  it 'can accept a friendship invite' do
    first_user = create(:user)
    second_user = create(:user)
    first_user.send_invitation(second_user)
    second_user.accept_request(first_user)
    second_user.reload
    expect(second_user.friends.length).to eq(1)
  end
end

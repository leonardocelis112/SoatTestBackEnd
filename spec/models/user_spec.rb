require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = build(:user)
  end
  it 'Should create and save an user' do
    expect(@user.save).to be(true)
  end

  it 'Should not save without the required fields' do
    @user.password = nil
    @user.email = nil
    expect(@user.save).to be(false)
    expect(@user.errors).to include(:password, :email)
  end

  it 'Should add a role to an user' do
    @user.save
    @user.add_role(:admin)
    expect(@user.has_role?(:admin)).to be(true)
  end
end

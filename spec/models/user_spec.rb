require 'rails_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @list = FactoryGirl.create(:list)
    @user.list << @list
  end

  it {  expect(@user).to respond_to(:id) }
  it {  expect(@user).to respond_to(:email) }
  it {  expect(@user).to respond_to(:created_at) }
  it {  expect(@user).to respond_to(:updated_at) }
  it {  expect(@user).to respond_to(:reset_password_token) }
  it {  expect(@user).to respond_to(:remember_created_at) }
  it {  expect(@user).to respond_to(:sign_in_count) }
  it {  expect(@user).to respond_to(:current_sign_in_at) }
  it {  expect(@user).to respond_to(:list) }

  it "not valid" do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it "invalid without password" do
    user = User.new(email: "email@exmaple.com")
    expect(user.save).not_to eq(true)
  end

  it "has many list" do
    expect(@user.list).to include(@list)
  end

end
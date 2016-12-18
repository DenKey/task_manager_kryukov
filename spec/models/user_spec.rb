require 'rails_helper'

describe User do

  let(:list) { create(:list) }
  let(:user) { create(:user) }
  let(:user_no_pass) { User.new(email: "email@exmaple.com") }

  before do
    user.list << list
  end

  subject { user }

  it {  should respond_to(:id) }
  it {  should respond_to(:email) }
  it {  should respond_to(:created_at) }
  it {  should respond_to(:updated_at) }
  it {  should respond_to(:reset_password_token) }
  it {  should respond_to(:remember_created_at) }
  it {  should respond_to(:sign_in_count) }
  it {  should respond_to(:current_sign_in_at) }
  it {  should respond_to(:list) }

  it "not valid" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "invalid without password" do
    expect(user_no_pass.save).not_to eq(true)
  end

  it "has many list" do
    expect(user.list).to include(list)
  end

end
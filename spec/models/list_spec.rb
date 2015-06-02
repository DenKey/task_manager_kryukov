require 'rails_helper'

describe List do

  before(:each) do
    @list = FactoryGirl.create(:list)
  end

  it { expect(@list).to respond_to(:id) }
  it { expect(@list).to respond_to(:user_id) }
  it { expect(@list).to respond_to(:title) }
  it { expect(@list).to respond_to(:description) }
  it { expect(@list).to respond_to(:updated_at) }
  it { expect(@list).to respond_to(:created_at) }
  it { expect(@list).to respond_to(:todo) }

  it 'not be valid' do
    @list.user_id = nil
    expect(@list).not_to be_valid
  end

  it "be valid" do
    expect(@list).to be_valid
  end

  it "has many todo" do
    @list.todo << Todo.new
    @list.todo << Todo.new
    expect(@list.todo).not_to be_empty
  end

  it "belongs to user" do
    @user = FactoryGirl.create(:user)
    @list.user_id = @user.id
    expect(@list.user).to eq(@user)
  end

  it "title in 3..40" do
    @list.title = "tw"
    expect(@list).not_to be_valid
    @list.title = SecureRandom.hex(41)
    expect(@list).not_to be_valid
  end

  it "description max 140 symbols" do
    @list.description = SecureRandom.hex(150)
    expect(@list).not_to be_valid
  end
end
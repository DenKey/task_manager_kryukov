require 'rails_helper'

describe List do
  
  let(:list) { create(:list) }
  let(:user) { create(:user) }

  subject { list }

  it { should respond_to(:id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:created_at) }
  it { should respond_to(:todo) }

  it 'not be valid' do
    list.user_id = nil
    expect(list).not_to be_valid
  end

  it "be valid" do
    should be_valid
  end

  it "has many todo" do
    list.todo << Todo.new
    list.todo << Todo.new
    expect(list.todo).not_to be_empty
  end

  it "belongs to user" do
    list.user_id = user.id
    expect(list.user).to eq(user)
  end

  it "title in 3..40" do
    list.title = "tw"
    expect(list).not_to be_valid
    list.title = SecureRandom.hex(41)
    expect(list).not_to be_valid
  end

  it "description max 140 symbols" do
    list.description = SecureRandom.hex(150)
    expect(list).not_to be_valid
  end
end
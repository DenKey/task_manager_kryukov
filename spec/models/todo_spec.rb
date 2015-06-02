require 'rails_helper'

describe Todo do

  before(:each) do
    @todo = FactoryGirl.create(:todo)
  end

  it { expect(@todo).to respond_to(:id) }
  it { expect(@todo).to respond_to(:content) }
  it { expect(@todo).to respond_to(:list_id) }
  it { expect(@todo).to respond_to(:created_at) }
  it { expect(@todo).to respond_to(:updated_at) }
  it { expect(@todo).to respond_to(:done) }
  it { expect(@todo).to respond_to(:deadline) }
  it { expect(@todo).to respond_to(:priority) }
  it { expect(@todo).to respond_to(:list) }

  it "done" do
    expect(@todo).not_to be_done
  end

  it "have deadline" do
    @todo.deadline = Time.now
    expect(@todo).to be_deadline
  end

  it "content size" do
    @todo.content = SecureRandom.hex(150)
    expect(@todo).not_to be_valid
  end

  it "belongs to list" do
    @list = FactoryGirl.create(:list)
    @todo.list_id = @list.id
    expect(@todo.list).to eq(@list)
  end
end
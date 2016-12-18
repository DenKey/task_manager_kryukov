require 'rails_helper'

describe Todo do

  let(:todo) { create(:todo) }
  let(:list) { create(:list) }

  subject { todo }

  it { should respond_to(:id) }
  it { should respond_to(:content) }
  it { should respond_to(:list_id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:done) }
  it { should respond_to(:deadline) }
  it { should respond_to(:priority) }
  it { should respond_to(:list) }

  it "done" do
    expect(todo).not_to be_done
  end

  it "have deadline" do
    todo.deadline = Time.now
    should be_deadline
  end

  it "content size" do
    todo.content = SecureRandom.hex(150)
    expect(todo).not_to be_valid
  end

  it "belongs to list" do
    todo.list_id = list.id
    expect(todo.list).to eq(list)
  end
end
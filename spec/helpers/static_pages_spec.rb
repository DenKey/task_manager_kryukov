require 'rails_helper'

describe StaticPagesHelper do

  it 'resource name' do
    expect(resource_name).to eq(:user)
  end

  it 'resource' do
    resource
    expect(@resource).to be_a_new(User)
  end

  it 'devise_mapping' do
    devise_mapping
    expect(@devise_mapping).to be_instance_of(Devise::Mapping)
  end
end
require 'rails_helper'

describe 'Application routes for User' do
  before do
    user = User.create(:email => 'user@example.com', :password => 'password')
  end

  before(:each) do
    visit '/login'
    within(".panel-body") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Login'
  end

  it 'lists in user main page' do
    expect(get("/lists")).to route_to("lists#index")
  end

  it 'profile is edit register data' do
    expect(get("/profile")).to route_to("registrations#edit")
  end

end
require 'rails_helper'

describe 'User auth system' do

  before :each do
    user = User.create(:email => 'user@example.com', :password => 'password')
  end

  it "signs me in" do
    visit '/login'
    within(".panel-body") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Login'
    expect(page).to have_content 'Lists'
  end


  it "register me in" do
    visit '/sign_up'
    within(".panel-body") do
      fill_in 'Email', :with => 'testregister@example.com'
      fill_in("Password", with: 'password', :match => :prefer_exact)
      fill_in("Confirm Password", with: 'password', :match => :prefer_exact)
    end
    click_button 'Register'
    expect(page).to have_content 'Welcome!'
  end

end
require 'rails_helper'

describe 'Application routes for Guest' do

  it 'not logged user view login and registration page' do
    expect(get("/")).to route_to("static_pages#index")
  end

  it 'user can view privacy policy' do
    expect(get("/privacy_policy")).to route_to("static_pages#privacy_policy")
  end

end
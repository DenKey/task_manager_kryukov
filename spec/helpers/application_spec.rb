require 'rails_helper'

describe ApplicationHelper do
  let(:link_path) { "/profile/edit" }

  it 'true if current page' do
    allow(self).to receive(:current_page?).with(link_path).and_return(true)
    expect(is_active?(link_path)).to eq("active")
  end
end
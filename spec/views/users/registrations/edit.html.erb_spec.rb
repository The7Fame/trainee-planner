# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/registrations/edit.html.erb', type: :view do
  let(:user) { create(:user) }

  before do
    without_partial_double_verification do
      allow(view).to receive(:resource).and_return(User.new)
      allow(view).to receive(:resource_name).and_return(:user)
      allow(view).to receive(:devise_mapping).and_return(Devise.mappings[:user])
    end
    render template: 'users/registrations/edit'
  end

  it { expect(rendered).to have_xpath "//input[contains(@id, 'user_first_name')]" }
  it { expect(rendered).to have_xpath "//input[contains(@id, 'user_last_name')]" }
  it { expect(rendered).to have_xpath "//input[contains(@id, 'user_email')]" }
  it { expect(rendered).to have_xpath "//input[contains(@id, 'user_password')]" }
  it { expect(rendered).to have_xpath "//input[contains(@id, 'user_password_confirmation')]" }
  it { expect(rendered).to have_xpath "//input[contains(@id, 'user_current_password')]" }
  it { expect(rendered).to have_button 'Update' }
end

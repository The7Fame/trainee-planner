# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/show', type: :view do
  let(:category) { create(:category) }
  let(:user) { create(:user) }

  before do
    sign_in(user)
    assign(:category, category)
    render template: 'categories/show'
  end

  it 'field category name' do
    expect(rendered).to include(CGI.escapeHTML(category.name))
  end

  describe 'buttons' do
    it { expect(rendered).to have_xpath '//button[contains(@class, btn)]' }
    it { expect(rendered).to have_xpath '//a[contains(@class, btn)]' }
  end
end

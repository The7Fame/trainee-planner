# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  before { render template: 'home/index' }

  it 'include empty tag div' do
    expect(rendered).to include('div', '')
  end
end

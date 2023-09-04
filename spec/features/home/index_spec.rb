# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  describe 'start page' do
    before { visit root_path }

    it { expect(page).to have_xpath "//div[contains(@class, 'container')]" }
    it { expect(page).to have_button 'Language' }

    describe 'dropdown menu of language button' do
      before { click_button 'Language' }

      it { expect(page).to have_xpath "//ul[contains(@class,'dropdown-menu')]" }
    end

    describe 'switch language to ru' do
      before do
        click_button 'Language'
        click_link 'RU'
      end

      it { expect(page).to have_button 'Язык' }
    end
  end
end

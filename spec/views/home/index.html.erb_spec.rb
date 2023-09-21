# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  let(:user) { create(:user, events: [event_future, event_today]) }
  let(:user_presenter) { UserPresenter.new(user) }
  let(:category) { create(:category) }
  let(:event_today) { create(:event, event_date: DateTime.now + 5.minutes, category:) }
  let(:event_future) { create(:event, event_date: DateTime.now.tomorrow, category:) }

  describe 'when user is authenticated' do
    before do
      sign_in(user)
      assign(:user, user_presenter)
      render template: 'home/index', locale: I18n.default_locale
    end

    it 'include name of user' do
      expect(rendered).to have_content(t('user.welcome', user: user_presenter.user_name))
    end

    it 'include future events' do
      expect(rendered).to have_content(t('user.future_events', count: user_presenter.future_events_count))
    end

    it 'include today events' do
      expect(rendered).to have_content(t('user.today_events', count: user_presenter.today_events_count))
    end
  end

  describe 'when user is not authenticated' do
    before { render template: 'home/index', locale: I18n.default_locale }

    it { expect(rendered).to have_content(t('user.start')) }
    it { expect(rendered).to have_no_content(t('user.welcome', user: user_presenter.user_name)) }
    it { expect(rendered).to have_no_content(t('user.future_events', count: user_presenter.future_events_count)) }
    it { expect(rendered).to have_no_content(t('user.today_events', count: user_presenter.today_events_count)) }
  end
end

# frozen_string_literal: true

RSpec.describe UserPresenter, type: :presenter do
  subject(:user_presenter) { described_class.new(user) }

  let(:category) { create(:category) }
  let(:user) { create(:user, first_name: 'First', last_name: 'Last') }

  describe '#user_name' do
    context 'when user has first_name and last_name' do
      it { expect(user_presenter.user_name).to eq("#{user.first_name} #{user.last_name}") }
    end

    context 'when user has only first_name' do
      let(:user) { create(:user, first_name: 'First', last_name: nil) }

      it { expect(user_presenter.user_name).to eq(user.first_name) }
    end
  end

  describe '#future_events_count' do
    context 'when user has events in future' do
      before { create_list(:event, 2, event_date: DateTime.now.tomorrow, category:, user:) }

      it { expect(user_presenter.future_events_count).to eq(2) }
    end

    context 'when user has no events in future' do
      it { expect(user_presenter.future_events_count).to eq(0) }
    end
  end

  describe '#today_events_count' do
    context 'when user has events today' do
      before { create_list(:event, 2, event_date: DateTime.now + 5.minutes, category:, user:) }

      it { expect(user_presenter.today_events_count).to eq(2) }
    end

    context 'when user has no events today' do
      it { expect(user_presenter.today_events_count).to eq(0) }
    end
  end
end

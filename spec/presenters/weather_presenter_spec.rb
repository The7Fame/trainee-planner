# frozen_string_literal: true

RSpec.describe WeatherPresenter, type: :presenter do
  subject(:weather_presenter) { described_class.new(event:, time_params:) }

  let(:user) { create(:user) }
  let(:event) { create(:event, user:, event_date: DateTime.now + 10.minutes) }

  describe '#weather' do
    context 'when weather is available' do
      let(:time_params) { { time: '00:00' } }

      it { expect(weather_presenter.temperature).not_to eq('Information is not available') }
      it { expect(weather_presenter.on_the_street).not_to eq('Information is not available') }
      it { expect(weather_presenter.summary).not_to eq('Information is not available') }
    end

    context 'when weather is not available' do
      let(:time_params) { { time: nil } }
      let(:event) { create(:event, user:, event_date: DateTime.now.tomorrow) }

      it { expect(weather_presenter.temperature).to eq('Information is not available') }
      it { expect(weather_presenter.on_the_street).to eq('Information is not available') }
      it { expect(weather_presenter.summary).to eq('Information is not available') }
    end
  end
end

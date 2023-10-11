# frozen_string_literal: true

require './lib/weather/forecast'
require 'spec_helper'
require 'weather/forecast'

module Weather
  describe Forecast do
    subject(:forecast) { described_class.new(date: event.event_date, time_params:) }

    let(:user) { create(:user) }
    let(:event) { create(:event, user:, event_date: DateTime.now + 1.minute) }
    let(:date) { event.event_date.strftime('%Y-%m-%d') }

    describe '#what_datetime' do
      context 'when no time_params' do
        let(:time_params) { nil }

        it { expect(forecast.what_datetime).to eq "#{date} 00:00:00" }
      end

      context 'when time_params present' do
        let(:time_params) { { time: '12:00' } }

        it { expect(forecast.what_datetime).to eq "#{date} #{time_params[:time]}:00" }
      end
    end

    describe '#what_weather' do
      let(:time_params) { { time: '01:00' } }

      it 'has key on_the_street' do
        expect(forecast.what_weather).to have_key(:on_the_street)
      end

      it 'has key temperature' do
        expect(forecast.what_weather).to have_key(:temperature)
      end

      it 'has key summary' do
        expect(forecast.what_weather).to have_key(:summary)
      end
    end
  end
end

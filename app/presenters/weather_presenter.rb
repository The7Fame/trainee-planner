# frozen_string_literal: true

require './lib/weather/forecast'

class WeatherPresenter
  def initialize(event:, time_params:)
    @prediction = Weather::Forecast.new(date: event.event_date, time_params:).what_weather
  end

  def temperature
    @prediction.present? ? @prediction[:temperature] : I18n.t('event.info')
  end

  def on_the_street
    @prediction.present? ? @prediction[:on_the_street].presence : I18n.t('event.info')
  end

  def summary
    @prediction.present? ? @prediction[:summary].presence : I18n.t('event.info')
  end
end

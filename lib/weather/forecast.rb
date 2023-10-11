# frozen_string_literal: true

module Weather
  class Forecast
    include HTTParty
    base_uri 'api.ambeedata.com/weather/history'

    def initialize(date:, time_params:)
      @date = date.strftime('%Y-%m-%d').to_s
      @options = {
        'X-Api-Key' => ENV.fetch('API'),
        'Content-Type' => 'application/json'
      }
      @time_params = time_params
    end

    def what_datetime
      time = @time_params.present? ? "#{@time_params[:time]}:00" : '00:00:00'
      "#{@date} #{time}"
    end

    def what_weather
      return unless weather['message'] == 'success'

      info = weather['data']['history'][0]
      sign = info['temperature'].to_i.positive? ? '+' : '-'
      {
        on_the_street: info['icon'].capitalize,
        temperature: "#{sign} #{info['temperature']} C",
        summary: (info['summary']).to_s
      }
    end

    private

    def weather
      datetime = what_datetime
      response = self.class.get(
        "/by-lat-lng?lat=#{ENV.fetch('LAT')}&lng=#{ENV.fetch('LNG')}&from=#{datetime}&to=#{datetime}&units=si",
        headers: @options
      )
      JSON.parse(response.body)
    end
  end
end

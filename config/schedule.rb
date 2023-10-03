# frozen_string_literal: true

require File.expand_path("#{File.dirname(__FILE__)}/environment")

set :output, './log/cron.log'
every 1.minute do
  events = Event.where.not(reminder_on: nil)
  events.each do |event|
    user = event.user
    time = event.reminder_on - DateTime.now
    runner "SendReminderEmailJob.set(wait: #{time.seconds}).perform_later(#{user.id}, #{event.id})"
  end
end

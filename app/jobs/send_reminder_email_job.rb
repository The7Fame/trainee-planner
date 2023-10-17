# frozen_string_literal: true

class SendReminderEmailJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    reminder_to_nil(job)
  end

  def perform(user_id, event_id)
    user = User.find(user_id)
    event = Event.find(event_id)
    ReminderMailer.reminder(user:, event:).deliver_now
  end

  private

  def reminder_to_nil(job)
    event_id = job.arguments.second
    event = Event.find(event_id)
    event.update(reminder_on: nil)
  end
end

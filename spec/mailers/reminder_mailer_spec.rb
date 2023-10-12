# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ReminderMailer do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:event) { create(:event, user:, category:) }
  let(:mailer) { described_class.reminder(user:, event:).deliver_now }

  describe '#reminder' do
    before { described_class.default_url_options[:host] = 'localhost:3000' }

    it 'renders the subject' do
      expect(mailer.subject).to eq "Reminder: #{event.name} is coming soon"
    end

    it 'renders the receiver email' do
      expect(mailer.to).to eq [user.email]
    end

    it 'renders the sender email' do
      expect(mailer.from).to eq ['noreply@example.com']
    end

    it 'renders the user name' do
      expect(mailer.body.encoded).to match("Hi, #{user.first_name}")
    end

    it 'renders the name of the event' do
      expect(mailer.body.encoded).to match(
        "We are sending you this email to remind you that #{event.name} is coming soon!"
      )
    end

    it 'renders the date of the event' do
      expect(mailer.body.encoded).to match("Date: #{event.event_date}")
    end
  end
end

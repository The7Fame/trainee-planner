# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :name, presence: true
  validates :event_date, presence: true

  validate :reminder_date_validity, if: :reminder_on_changed?
  validate :event_date_validity

  private

  def reminder_date_validity
    return if reminder_on.blank?

    if reminder_on.past?
      errors.add(:reminder_on, "can't be in the past")
    elsif reminder_on >= event_date
      errors.add(:reminder_on, "can't be equal or greater than event date")
    end
  end

  def event_date_validity
    return if event_date&.future?

    errors.add(:event_date, "can't be in the past")
  end
end

# frozen_string_literal: true

5.times do |index|
  User.create_or_find_by!(
    first_name: Faker::Name.first_name,
    email: "user_#{index + 1}@example.com",
    password: 'password'
  )
rescue ActiveRecord::RecordInvalid => e
  Rails.logger.debug e.message
end

# frozen_string_literal: true

5.times do |index|
  User.create_or_find_by!(
    first_name: "User#{index + 1}",
    email: "test#{index + 1}@test.com",
    password: "password#{index + 1}"
  )
rescue ActiveRecord::RecordInvalid => e
  Rails.logger.debug e.message
end

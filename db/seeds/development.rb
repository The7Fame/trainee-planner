# frozen_string_literal: true

%w[Personal Work Vacation].each { |category| Category.find_or_create_by!(name: category) }

5.times do |index|
  User.find_or_create_by!(email: "user_#{index}@example.com") do |user|
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.password = 'password'
  end
end

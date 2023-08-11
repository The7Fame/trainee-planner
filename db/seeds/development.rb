# frozen_string_literal: true

%w[Personal Work Vacation].each { |category| Category.find_or_create_by!(name: category) }

# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :user_categories
  has_many :events, dependent: :destroy
  has_many :users, through: :user_categories
end

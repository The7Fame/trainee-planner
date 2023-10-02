# frozen_string_literal: true

require 'spec_helper'

describe 'CategoryMethods' do
  describe '.create_category' do
    subject(:create_or_find_category) { Category.create_category(category_params:) }

    let(:category_work) { build(:category, :work) }
    let(:category_params) { { name: category_work.name } }

    it 'create a category by name' do
      expect { create_or_find_category }.to change(Category, :count).from(0).to(1)
    end

    it 'find a category by name' do
      create(:category, :work)
      expect { create_or_find_category }.not_to change(Category, :count).from(1)
    end
  end

  describe '.belongs_to_many_users?' do
    let(:category) { create(:category) }
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    it 'category belongs to many users' do
      user1.categories.push(category)
      user2.categories.push(category)

      expect(category.belongs_to_many_users?).to be true
    end

    it 'category belongs to one user' do
      user1.categories.push(category)

      expect(category.belongs_to_many_users?).to be false
    end
  end
end

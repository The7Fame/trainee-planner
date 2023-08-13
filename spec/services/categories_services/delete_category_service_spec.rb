# frozen_string_literal: true

module CategoriesServices
  describe DeleteCategoryService do
    let(:service) { described_class.new(category: category_work, user:) }
    let!(:category_work) { create(:category, :work) }
    let(:user) { create(:user) }

    before { create(:user_category, user:, category: category_work) }

    describe '#call' do
      context 'when category is deleted' do
        it 'delete categories' do
          expect { service.call }.to change(Category, :count).from(1).to(0)
        end

        it 'delete association' do
          expect { service.call }.to change(UserCategory, :count).from(1).to(0)
        end
      end

      context 'when category belongs to another user' do
        let(:user2) { create(:user) }

        before { create(:user_category, user: user2, category: category_work) }

        it 'do not delete category' do
          expect { service.call }.not_to change(Category, :count).from(1)
        end

        it 'delete association' do
          expect { service.call }.to change(UserCategory, :count).from(2).to(1)
        end
      end
    end
  end
end

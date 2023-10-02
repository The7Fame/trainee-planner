# frozen_string_literal: true

module CategoriesServices
  describe CreateCategoryService do
    let(:service) { described_class.new(category:, category_params:, user:) }
    let(:category) { build(:category, :personal) }
    let(:category_params) { { name: category.name } }
    let(:user) { create(:user) }
    let!(:category_work) { create(:category, :work) }

    before { create(:user_category, user:, category: category_work) }

    describe '#call' do
      context 'when category is created' do
        it 'saves the category' do
          expect { service.call }.to change(Category, :count).from(1).to(2)
        end

        it 'save association' do
          expect { service.call }.to change(UserCategory, :count).from(1).to(2)
        end
      end

      context 'when category in user categories' do
        let(:category_params) { { name: category_work.name } }
        let(:category) { build(:category, :work) }

        it 'not save the category' do
          expect { service.call }.not_to change(Category, :count).from(1)
        end

        it 'not save association' do
          expect { service.call }.not_to change(UserCategory, :count).from(1)
        end
      end

      context 'when name is empty' do
        let(:category_params) { { name: nil } }
        let(:category) { build(:category, name: nil) }

        it 'not save the category' do
          expect { service.call }.not_to change(Category, :count).from(1)
        end

        it 'not save association' do
          expect { service.call }.not_to change(UserCategory, :count).from(1)
        end
      end
    end
  end
end

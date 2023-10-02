# frozen_string_literal: true

module CategoriesServices
  describe UpdateCategoryService do
    let(:service) { described_class.new(category: category_work, category_params:, user: users[0]) }
    let(:category_params) { { name: category_personal.name } }
    let!(:category_work) { create(:category, :work) }
    let!(:users) { create_list(:user, 2) }
    let(:category_personal) { build(:category, :personal) }

    before { create(:user_category, user: users[0], category: category_work) }

    describe '#call' do
      context 'when category is updated' do
        it 'dont change count of categories' do
          expect { service.call }.not_to change(Category, :count).from(1)
        end

        it 'dont change count of associations' do
          expect { service.call }.not_to change(UserCategory, :count).from(1)
        end
      end

      context 'when category belong user' do
        before { create(:user_category, user: users[1], category: category_work) }

        it 'save new the category' do
          expect { service.call }.to change(Category, :count).from(1).to(2)
        end

        it 'dont change count of associations' do
          expect { service.call }.not_to change(UserCategory, :count).from(2)
        end
      end
    end
  end
end

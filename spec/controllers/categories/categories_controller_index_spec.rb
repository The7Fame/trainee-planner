# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    let(:category_work) { create(:category, :work) }

    before { get :index }

    describe 'when user is authenticated' do
      before do
        create(:user_category, user:, category: category_work)
        sign_in(user)
        get :index
      end

      it 'return status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders index template' do
        expect(response).to render_template('index')
      end

      it 'assigns @categories' do
        expect(assigns(:categories)).to match_array([category_work])
      end
    end

    describe 'when user in not authenticated' do
      it 'return status 302' do
        expect(response).to have_http_status(:found)
      end

      it 'redirect to sign in page' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

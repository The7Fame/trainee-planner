# frozen_string_literal: true

require 'rails_helper'

module Events
  RSpec.describe SearchQuery do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let!(:event_one) { create(:event, user:, category:, name: 'One', event_date: DateTime.now + 10.minutes) }
    let!(:event_two) { create(:event, user:, category:, name: 'Two', event_date: DateTime.now + 20.minutes) }

    subject(:events) { described_class.new(search_params:, user:) }
    describe '#call' do
      before { create(:user_category, user:, category:) }

      context 'when search by name of event' do
        let(:search_params) { { search: event_one.name } }

        it { expect(events.call).to eq([event_one]) }
      end

      context 'when search by category' do
        let(:search_params) { { category_id: category.id } }

        it { expect(events.call).to eq([event_one, event_two]) }
      end

      context 'when search by name and by category' do
        let(:search_params) { { search: event_one.name, category_id: category.id } }

        it { expect(events.call).to eq([event_one]) }
      end

      context 'when unknown name of event' do
        let(:search_params) { { search: 'NewName' } }

        it { expect(events.call).to eq([]) }
      end
    end
  end
end

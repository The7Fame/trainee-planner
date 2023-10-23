# frozen_string_literal: true

describe 'Categories routes path', type: :routing do
  let(:category) { create(:category) }

  it 'routes Categories#index' do
    expect(get('/categories')).to route_to(controller: 'categories', action: 'index')
  end

  it 'routes Categories#create' do
    expect(post('/categories')).to route_to(controller: 'categories', action: 'create')
  end

  it 'routes Categories#show' do
    expect(get("/categories/#{category.id}")).to route_to(controller: 'categories',
                                                          action: 'show', id: category.id.to_s)
  end

  it 'routes Categories#destroy' do
    expect(delete("/categories/#{category.id}")).to route_to(controller: 'categories',
                                                             action: 'destroy', id: category.id.to_s)
  end

  it 'routes Categories#update' do
    expect(patch("/categories/#{category.id}")).to route_to(controller: 'categories',
                                                            action: 'update', id: category.id.to_s)
  end
end

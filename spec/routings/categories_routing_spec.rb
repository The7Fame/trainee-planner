# frozen_string_literal: true

describe 'Categories routes path', type: :routing do
  let(:category) { create(:category) }

  it 'routes Categories#index' do
    expect(get('/categories')).to route_to(controller: 'categories', action: 'index', locale: I18n.default_locale)
  end

  it 'routes Categories#create' do
    expect(post('/categories')).to route_to(controller: 'categories', action: 'create', locale: I18n.default_locale)
  end

  it 'routes Categories#show' do
    expect(get("/categories/#{category.id}")).to route_to(controller: 'categories', locale: I18n.default_locale,
                                                          action: 'show', id: category.id.to_s)
  end

  it 'routes Categories#destroy' do
    expect(delete("/categories/#{category.id}")).to route_to(controller: 'categories', locale: I18n.default_locale,
                                                             action: 'destroy', id: category.id.to_s)
  end

  it 'routes Categories#update' do
    expect(patch("/categories/#{category.id}")).to route_to(controller: 'categories', locale: I18n.default_locale,
                                                            action: 'update', id: category.id.to_s)
  end
end

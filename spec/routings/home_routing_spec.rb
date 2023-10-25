# frozen_string_literal: true

describe 'Home routes path', type: :routing do
  it 'root_path' do
    expect(get('/')).to route_to(controller: 'home', action: 'index')
  end

  it 'path to locale en' do
    expect(get('/en')).to route_to(controller: 'home', action: 'index', locale: 'en')
  end

  it 'path to locale ru' do
    expect(get('/ru')).to route_to(controller: 'home', action: 'index', locale: 'ru')
  end
end

# frozen_string_literal: true

describe 'Users routes path', type: :routing do
  it 'path to sign up path' do
    expect(get('/sign_up')).to route_to(controller: 'users/registrations', action: 'new')
  end

  it 'path to sign in' do
    expect(get('/sign_in')).to route_to(controller: 'devise/sessions', action: 'new')
  end

  it 'path to edit' do
    expect(get('/edit')).to route_to(controller: 'users/registrations', action: 'edit')
  end
end

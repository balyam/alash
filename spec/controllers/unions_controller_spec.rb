require 'rails_helper'

RSpec.describe UnionsController, type: :controller do
  context 'GET #index' do
    it 'shows all unions' do
      get :index
      expect(response.status).to eq(200)
    end
  end
  context 'GET #show' do
    it 'shows one union' do
    end
  end
end

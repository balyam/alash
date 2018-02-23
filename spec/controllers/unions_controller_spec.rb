require 'rails_helper'

RSpec.describe UnionsController, type: :controller do
  context 'GET #index' do
    it 'show all unions' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end

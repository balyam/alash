require 'rails_helper'

RSpec.describe PersonsController, type: :controller do
  context 'GET #index' do
    it 'show all persons' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end

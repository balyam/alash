require 'rails_helper'

RSpec.describe ClansController, type: :controller do
  context 'GET #index' do
    it 'show all clans' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end

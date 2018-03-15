require 'rails_helper'

RSpec.describe TribesController, type: :controller do
  context 'GET #index' do
    it 'show all tribes' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
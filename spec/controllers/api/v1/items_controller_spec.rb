require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe '#index' do
    before :each do
      get :index, format: :json
    end

    it 'successfully responds to requests' do
      expect(response).to be_success
    end
    
    it 'returns JSON' do
        expect(response.content_type).to eq 'application/json'
    end
  end
  
end

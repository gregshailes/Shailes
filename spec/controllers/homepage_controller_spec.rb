require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe 'GET index' do

    before do
      get :index
    end

    it 'renders the index' do
      expect(response).to render_template 'homepage/index'
    end
  end
end

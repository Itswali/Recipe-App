require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Emma', email: 'balixemma@mail.com', password: 'password') }
  let(:food) { user.foods.create(name: 'apple', measuring_unit: 'kg', price: '4', user_id: user.id) }
  let(:recipe) do
    user.recipes.create(name: 'Pizza', cookingTime: 1, preparationTime: '2', description: 'Try to test', public: false,
                        user_id: user.id)
    describe 'GET /index' do
      before do
        sign_in user
        get new_recipe_recipe_food_path(recipe)
      end
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respond to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Add Recipe Food')
    end
  end
end
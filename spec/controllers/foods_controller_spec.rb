# # spec/controllers/foods_controller_spec.rb
# require 'rails_helper'

# RSpec.describe FoodsController, type: :controller do
#   describe 'GET #index' do
#     it 'assigns @foods' do
#       user = create(:user) # Assumes you have a factory for User
#       food = create(:food, user: user) # Assumes you have a factory for Food
#       get :index
#       expect(assigns(:foods)).to eq([food])
#     end

#     it 'renders the index template' do
#       get :index
#       expect(response).to render_template(:index)
#     end
#   end

#   describe 'GET #new' do
#     it 'assigns a new Food to @food' do
#       get :new
#       expect(assigns(:food)).to be_a_new(Food)
#     end

#     it 'renders the new template' do
#       get :new
#       expect(response).to render_template(:new)
#     end
#   end

#   describe 'POST #create' do
#     context 'with valid parameters' do
#       it 'creates a new Food' do
#         expect {
#           post :create, params: { food: attributes_for(:food) }
#         }.to change(Food, :count).by(1)
#       end

#       it 'redirects to foods_path' do
#         post :create, params: { food: attributes_for(:food) }
#         expect(response).to redirect_to(foods_path)
#       end
#     end

#     context 'with invalid parameters' do
#       it 'does not create a new Food' do
#         expect {
#           post :create, params: { food: attributes_for(:food, name: nil) }
#         }.not_to change(Food, :count)
#       end

#       it 'renders the new template' do
#         post :create, params: { food: attributes_for(:food, name: nil) }
#         expect(response).to render_template(:new)
#       end
#     end
#   end
# end

# spec/models/recipe_spec.rb

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create!(name: 'recipe', email: 'balix@gmail.com', password: 'password') }
  let(:recipe) { Recipe.create(name: 'Recipe 1', description: 'Recipe description', user:) }

  it 'should have name recipe' do
    expect(recipe.name).to eql('Recipe 1')
  end

  it 'should have description' do
    expect(recipe.description).to eql('Recipe description')
  end
end

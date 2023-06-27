class RecipeFood < ApplicationRecord
    belongs_to :recipe, class_name: 'Recipe', foreign_key: 'recipe_id'

    validates :quantity, presence: true
end

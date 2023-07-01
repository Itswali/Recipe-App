class Food < ApplicationRecord
  has_many :recipe_foods, dependent: :delete_all
  # belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :user, class_name: 'User'

  validates :name, presence: true
  validates :measuring_unit, presence: true
  validates :price, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :quantity, presence: true
end

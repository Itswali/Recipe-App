class AddUserRefToFoods < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:foods, :user_id)
      add_reference :foods, :user, null: false, foreign_key: { to_table: :users }
    end
  end
end

class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.string :app
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end

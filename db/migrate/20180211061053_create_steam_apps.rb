class CreateSteamApps < ActiveRecord::Migration[5.1]
  def change
    create_table :steam_apps do |t|
      t.string :appid
      t.string :name
      
      t.timestamps
    end
  end
end

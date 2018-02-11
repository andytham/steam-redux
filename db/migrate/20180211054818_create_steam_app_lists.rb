class CreateSteamAppLists < ActiveRecord::Migration[5.1]
  def change
    create_table :steam_app_lists do |t|

      t.timestamps
    end
  end
end

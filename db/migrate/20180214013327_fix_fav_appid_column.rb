class FixFavAppidColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorites, :app, :appid
  end
end

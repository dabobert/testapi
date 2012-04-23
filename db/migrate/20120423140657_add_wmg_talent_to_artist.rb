class AddWmgTalentToArtist < ActiveRecord::Migration
  def change
    add_column :artist, :wmg_talent, :boolean
  end
end

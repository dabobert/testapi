class RenameTypeToArtistTypeIdInArtist < ActiveRecord::Migration
  change_table :artist do |t|
    t.rename :type, :artist_type_id
  end
end

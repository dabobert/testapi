class WmgAssetWork < ActiveRecord::Base
  self.table_name = 'wmg_artist'
  set_primary_key :artist_id
end

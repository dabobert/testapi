class RenameTypeInAsset < ActiveRecord::Migration
  change_table :wmg_asset do |t|
    t.rename :type, :asset_type
  end
end

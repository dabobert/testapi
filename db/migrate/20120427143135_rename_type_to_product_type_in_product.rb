class RenameTypeToProductTypeInProduct < ActiveRecord::Migration
  change_table :wmg_product do |t|
    t.rename :type, :product_type
  end
end

class RenameTypeToLabelTypeInLabel < ActiveRecord::Migration
  change_table :label do |t|
    t.rename :type, :label_type_id
  end
end

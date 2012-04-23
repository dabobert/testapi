class RenameTypeToReleaseGroupTypeInReleaseGroup < ActiveRecord::Migration
  change_table :release_group do |t|
    t.rename :type, :release_group_type_id
  end
end

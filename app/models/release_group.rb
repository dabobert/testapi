class ReleaseGroup < ActiveRecord::Base
  set_table_name 'release_group'
  belongs_to :group_type, :class_name=>"ReleaseGroupType"
  belongs_to :name, :class_name=>"ReleaseName", :foreign_key=>'name'
  belongs_to :artist_credit, :foreign_key=>"artist_credit"
  has_many :releases, :foreign_key=>"release_group"
end

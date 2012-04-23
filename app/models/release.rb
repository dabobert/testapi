class Release < ActiveRecord::Base
  set_table_name :release
  belongs_to :artist_credit, :foreign_key=>"artist_credit"
  belongs_to :name, :class_name=>"ReleaseName", :foreign_key=>'name'
  belongs_to :release_group, :foreign_key=>"release_group"
  has_many :release_labels, :foreign_key=>"release"
  has_many :labels, :through=>:release_labels
  has_many :mediums, :foreign_key=>'release'
  has_many :tracklists, :through=>:mediums
end

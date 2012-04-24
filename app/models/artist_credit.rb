class ArtistCredit < ActiveRecord::Base
  self.table_name = :artist_credit
  belongs_to :name, :class_name=>'ArtistName', :foreign_key => 'name'
  has_many :releases, :foreign_key=>"artist_credit"
  has_many :barcoded_releases, :class_name=>"Release", :foreign_key=>"artist_credit", :conditions => "barcode is not null"
  has_many :recordings, :foreign_key=>"artist_credit"
  has_many :tracks, :foreign_key=>"artist_credit"
  has_many :release_groups, :foreign_key=>"artist_credit"
end

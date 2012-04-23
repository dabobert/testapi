class Tracklist < ActiveRecord::Base
  set_table_name 'tracklist'
  has_many :mediums, :foreign_key=>'tracklist'
  has_many :releases, :through=>:mediums
  has_many :tracks, :foreign_key=>'tracklist'
  has_many :recordings, :through=>:tracks
end

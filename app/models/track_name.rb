class TrackName < ActiveRecord::Base
  self.table_name = 'track_name'
  has_many :recordings, :foreign_key=>"name"
  has_many :tracks, :foreign_key=>"name"
end

class Track < ActiveRecord::Base
  self.table_name = 'track'
  belongs_to :tracklist, :foreign_key=>"tracklist"
  belongs_to :recording, :foreign_key=>"recording"
  belongs_to :artist_credit, :foreign_key=>"artist_credit"
  belongs_to :name, :class_name=>"TrackName", :foreign_key=>"name"
end

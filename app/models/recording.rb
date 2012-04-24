class Recording < ActiveRecord::Base
  set_table_name 'recording'
  belongs_to :name, :class_name=>"TrackName", :foreign_key=>"name"
  belongs_to :artist_credit, :foreign_key=>"artist_credit"
  has_many :tracks, :foreign_key=>'recording'
  has_many :mediums, :through=>:tracks
  
  def self.seek(str)
    results = self.where("lower(name) = lower(?)", str)
    if results.blank?
      nil
    else
      results.first
    end
  end
end

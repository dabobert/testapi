class Medium < ActiveRecord::Base
  self.table_name = 'medium'
  belongs_to :release, :foreign_key=>'release'
  belongs_to :format, :class_name=>"MediumFormat", :foreign_key=>'medium_format'
  belongs_to :tracklist, :foreign_key=>"tracklist"
end

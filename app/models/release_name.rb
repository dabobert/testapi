class ReleaseName < ActiveRecord::Base
  set_table_name 'release_name'
  has_many :releases, :foreign_key=>'name'
  has_many :release_groups, :foreign_key=>'name'
  
  def self.seek(str)
    results = self.where("lower(name) = lower(?)", str)
    if results.blank?
      nil
    else
      results.first
    end
  end
  
  def origin(depth=3)
    release_group = self.release_groups.first
    response      = release_group.response(depth)
    response     += release_group.artist_credit.name.artist.talent_response(1)
    response[0][:adjacencies] << release_group.make_adjacency(release_group.artist_credit.name.artist)
    NodeTools::set_origin_height(response)
  end
  
  def to_s
    self.name
  end
  
  def type
    "Project"
  end
end

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
    hash = self.release_groups.first.response(depth)
    NodeTools::set_origin_height(hash)
  end
  
  def to_s
    self.name
  end
  
  def type
    "Project"
  end
end

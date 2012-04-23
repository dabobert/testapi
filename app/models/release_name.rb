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
  

  
  def to_s
    self.name
  end
  
  def type
    "Project"
  end
end

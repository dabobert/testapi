class Debug
  
  def self.gd
    ArtistName.find_by_name("Green Day")
  end
  
  def self.bja
    ArtistName.find_by_name("Billie Joe Armstrong")
  end
  
  def self.foo
    p=Proc.new {|t|   t.string :text, :limit => 1024 }
    TableMaker.bar( "Dogs")
  end
  
end

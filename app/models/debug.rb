class Debug
  
  def self.gd
    ArtistName.find_by_name("Green Day")
  end
  
  def self.bja
    ArtistName.find_by_name("Billie Joe Armstrong")
  end
  
  def self.foo
    p=Proc.new {|t|   t.string :text, :limit => 1024 }
    TableMaker.bar( "Dogs"){|t|   t.string :text, :limit => 1024 }
  end
  
  def self.wmggd
    WmgArtist.find(1077655)
  end
  
  def self.wmgbja
    WmgTalent.find(1044220)
  end
  
  def self.d
    Debug.wmgbja.origin(5)
  end
  
  def self.out(obj)
    obj.each do |a| puts "#{a[:data][:gcdm_type]} -> #{a[:id]}" end
  end
end

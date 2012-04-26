class Debug
  attr_accessor :ancestors, :data, :to_replace
  
  def out
    filters = ["contract"]
    @data.each_index do |pos|
      value = @data[pos]
      if filters.include? value[:data][:gcdm_type]    
        node = self.ancestor(value)
        @to_replace[:pos] << pos
        @to_replace[:keys][value[:id]] = node[:id]
      end
      clone = value.clone
      clone.delete(:adjacencies)
      @ancestors[(value[:data][:gcdm_type])] = clone
    end
    
    @to_replace[:pos] do |pos|
      #if @to_replace.keys.include? @data[pos][:id]
        anc_pos = self.seek_position(@to_replace[:key][(@data[pos][:id])])
        @data[anc_pos][:adjacencies] += self.update_source_adjacencies(@data[anc_pos][:id], @data[pos][:adjacencies])
      #end
    end
    
  end
  
  def seek_position(id)
    return nil if id.blank?
    @data.each_index do |pos|
      return pos if (@data[pos][:id] == id)
    end
  end
  
  def update_source_adjacencies(id, adjacencies)
    adjacencies.each do |adjacency|
      adjacency[:nodeFrom] = id
    end
  end
  
  def initialize(data)
    data = Debug.d if data.blank? 
    @data = data
    @ancestors = Hash.new
    @to_replace = Hash.new
  end
  
  def ancestor(hash)
    ancestor_type = 
      case hash[:data][:gcdm_type]
      when "contract"
        "artist"
      when "work"
        "contract"
      when "project"
        "contract"
      end
    @ancestors[ancestor_type]
  end
  
  def self.r(data=nil)
    data = Debug.d if data.blank?
    d = Debug.new data
    d.out
  end
  
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
  

end

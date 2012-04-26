class Debug
  attr_accessor :ancestors, :data, :to_replace
  
  def out
    filters = ["contract"]

    @data.each_index do |pos|
      value = @data[pos]
      clone = value.clone
            puts "-----------"
            puts "#{value[:data][:gcdm_type]} -> #{value[:data][:meta_type]} -> #{value[:id]} -> #{value[:name]} = #{self.ancestor(value)}"
            puts filters.include? value[:data][:gcdm_type]
      clone.delete(:adjacencies)
      @ancestors[(value[:data][:gcdm_type])] = clone
      
      if filters.include? value[:data][:gcdm_type]
        node = self.ancestor(value)
        #replaces data node
=begin        
        @data[pos][:data] = node[:data]
        @data[pos][:id] = node[:id]
        @data[pos][:name] = node[:name]
        @data[pos][:adjacencies].each do |adjacency|
          adjacency[:nodeFrom] = node[:id]
        end
        @to_replace[:id] = node[:id]
=end
       @data[pos] = nil
#        puts @data[pos]
      end
    end
    @data
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
  
  def self.r(data)
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

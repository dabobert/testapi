class Debug
  attr_accessor :ancestors, :data, :to_replace
  
  def out    
    filters = ["contract"]
    @ancestors = Hash.new
    @to_replace = Hash.new
    
    
    filters.each do |filter|
      @data.each_index do |pos|
        value = @data[pos]
        if value[:data][:gcdm_type] == filter
          node = self.ancestor(value)
          @to_replace[value[:id]] = node[:id]
        end
        clone = value.clone
        clone.delete(:adjacencies)
        @ancestors[(value[:data][:gcdm_type])] = clone
      end

      @data.each_index do |pos|
        #if the present node should be removed
        if @to_replace.keys.include? @data[pos][:id]
          anc_pos = self.seek_position(@to_replace[(@data[pos][:id])])
=begin          
          puts "#{filter}-----------"
          puts @data.inspect
          puts @data.class
          puts "======"
          puts anc_pos.inspect
          puts @data[anc_pos][:id].inspect
          puts @data[pos]
          puts @data[pos][:adjacencies].inspect
          
          puts self.update_source_adjacencies(@data[anc_pos][:id], @data[pos][:adjacencies]).inspect
=end          
          @data[anc_pos][:adjacencies] += self.update_source_adjacencies(@data[anc_pos][:id], @data[pos][:adjacencies])
          @data[pos] = nil
        elsif not((self.adjacencies(@data[pos]) | @to_replace.keys).blank?)
          data[pos][:adjacencies].delete_if do |hash|
            @to_replace.keys.include?(hash[:nodeFrom]) || @to_replace.keys.include?(hash[:nodeTo])
          end
        end
      end
    
      @data.compact!
    end
  end
  
  def seek_position(id)
    return nil if id.blank?
    @data.each_index do |pos|
      puts "====#{pos}"
      return pos if (@data[pos] != nil && @data[pos][:id] == id)
    end
  end
  
  def adjacencies(value)
    value[:adjacencies].collect do |a| a.values end.flatten
  end
  
  def update_source_adjacencies(id, adjacencies)
    adjacencies.each do |adjacency|
      adjacency[:nodeFrom] = id
    end
  end
  
  def initialize(data)
    data = Debug.d if data.blank? 
    @data = data
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

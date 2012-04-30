class NodeFilter
  attr_accessor :ancestors, :data, :to_replace
  
  def filter(filters) 

    @filters = filters
    @ancestors = Hash.new
    @to_replace = Hash.new
    
    @filters.each do |filter|
      @data.each_index do |pos|
        value = @data[pos]



        if value[:data][:gcdm_type] == filter
          node = self.ancestor(value)


puts "-------"
puts " ancestors=>#{ancestors.inspect}"
puts " node=>#{node.inspect}"
puts " value=>#{value.inspect}"
puts " pos=>#{pos}"
          @to_replace[value[:id]] = node[:id]
        end
        clone = value.clone
        clone.delete(:adjacencies)
        @ancestors[(value[:data][:gcdm_type])] = clone
      end

puts  @to_replace.inspect

      
      @data.each_index do |pos|
        #if the present node should be removed
        if @to_replace.keys.include? @data[pos][:id]
          anc_pos = self.seek_position(@to_replace[(@data[pos][:id])])  
          @data[anc_pos][:adjacencies] += self.update_source_adjacencies(@data[anc_pos][:id], @data[pos][:adjacencies])
          @data[pos] = nil
        elsif not((self.adjacencies(@data[pos]) | @to_replace.keys).blank?)
          
          @data[pos][:adjacencies].delete_if do |hash|
            @to_replace.keys.include?(hash[:nodeFrom]) || @to_replace.keys.include?(hash[:nodeTo])
          end
        end
      end
      @data.compact!
    end
    @data
  end
  
  def seek_position(id)
    return nil if id.blank?
    @data.each_index do |pos|
      #puts "====#{pos}"
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
        if hash[:data]["$type"] == "circle"
	  "contract"
	else
	  if (@ancestors.keys.include? "artist")
	    "artist"
	  else
	    "talent"
	  end
	end
      end
    
    return ancestor(@ancestors[ancestor_type]) if  @filters.include?(ancestor_type)
    @ancestors[ancestor_type]
  end

end

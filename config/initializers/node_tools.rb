module NodeTools
  attr_accessor :adjacencies, :other_nodes, :depth

=begin  
  def self.simplify_hashes array
    array.collect do |hash| hash[:nodeFrom]+hash[:nodeTo] end
  end
  
  def self.seek_position(data, id)
    return nil if id.blank?
    data.each_index do |pos|
      #puts "====#{pos}"
      return pos if (data[pos] != nil && data[pos][:id] == id)
    end
    return false
  end
=end
  
  def self.set_origin_height(hash)
    hash[0][:data]["$dim"]=16
    hash
  end
  
  def origin(depth=4)
    hash = self.response(depth)
    hash[0][:data]["$dim"]=26
    hash
  end
  
  def make_adjacency(obj)
    if self.respond_to?(:gcdm_object) && not(self.gcdm_object.blank?)
      from_gid = self.gcdm_object.gid
    else
      from_gid = self.gid
    end

    if obj.respond_to?(:gcdm_object) && not(obj.gcdm_object.blank?)
      to_gid = obj.gcdm_object.gid
    else
      to_gid = obj.gid
    end

    {
      :nodeFrom => from_gid,
      :nodeTo   => to_gid
    }
  end
  
  
  def make_node(obj)
    {  
      :data =>
        {
          "$color"=> "blue", 
          "$dim"=> 8, 
          "$type"=> "circle"
        },
      :type=>obj.type,
      :id=> obj.gid,
      :name=> obj.name.to_s
    }
  end
  
  def data
    #puts "==#{self.name}===#{self.class}==#{@depth}==="
    if self.respond_to?(:gcdm_object) && not(self.gcdm_object.blank?)
      gcdm_response = self.gcdm_object.response(@depth)
      color_value = self.gcdm_object.color
      shape_value = self.gcdm_object.shape
      type_value  = self.gcdm_object.type
      gid_value   = self.gcdm_object.gid
      meta_type_value = self.gcdm_object.meta_type
      unless gcdm_response.blank?
        head = gcdm_response.delete_at(0)
        self.adjacencies += head[:adjacencies]
        self.other_nodes += gcdm_response
      end
    else
      color_value = self.color
      shape_value = self.shape
      type_value  = self.type
      gid_value   = self.gid
      meta_type_value = self.meta_type
    end
    
    
    
    [{
      :adjacencies=>self.adjacencies,
      :data =>
        {
          "$color"=> color_value, 
          "$dim"=> 13, 
          "$type"=> shape_value,
          :meta_type=>meta_type_value,
          :gcdm_type =>type_value,
        },
      :id => gid_value,
      :name => self.name.to_s
    }]
  end
  
  def iterate(collection, depth=0, member_fn="")
    collection.collect do |object|
      if member_fn.blank?
        obj = object
      else
        obj = object.instance_eval(member_fn)
      end
      
      #Debug.echo obj.class.name
      self.adjacencies << self.make_adjacency(obj)
      self.other_nodes += obj.response(depth-1).flatten
    end
  end
  
  def meta_type
    self.type
  end
  
  #sets default color to grey
  def color
    if UI_CONFIG[self.type].blank?
      "#999999"
    else
      UI_CONFIG[self.type]["color"]
    end
  end
  
  def shape
    "square"
  end
  
end

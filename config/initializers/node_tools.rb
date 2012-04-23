module NodeTools
  attr_accessor :adjacencies, :other_nodes  

  
  def self.set_origin_height(hash)
    hash[0][:data]["$dim"]=16
    hash
  end
  
  def origin(depth=4)
    hash = self.response(depth)
    hash[0][:data]["$dim"]=16
    hash
  end
  
  def make_adjacency(obj)
    {
      :nodeFrom => self.gid,
      :nodeTo   => obj.gid
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
    [{
      :adjacencies=>self.adjacencies,
      :data =>
        {
          "$color"=> self.color, 
          "$dim"=> 8, 
          "$type"=> "circle",
          :gcdm_type =>self.type,
        },
      :id => self.gid,
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

      self.adjacencies << self.make_adjacency(obj)
      self.other_nodes += obj.response(depth-1).flatten
    end
  end
  
  #sets default color to grey
  def color
    "grey"
  end
  
end

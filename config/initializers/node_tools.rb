module NodeTools
  attr_accessor :adjacencies, :other_nodes
  
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
          "$color"=> "blue", 
          "$dim"=> 8, 
          "$type"=> "circle"
        },
      :type =>self.type,
      :id => self.gid,
      :name => self.name.to_s
    }]
  end
end

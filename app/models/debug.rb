class Debug
  require 'csv'
  
  attr_accessor :ancestors, :data, :to_replace
  
  def self.ext
    params = {:depth=>"0", :filters=>"asset,work,contract", :data_set=>"1", :callback=>"_jqjsp", "_1336074387947"=>"", :id=>"van halen"}
    @depth = params[:depth].to_i
    @filters = params[:filters] unless params[:filters].blank?
    @search_term = params[:id]
    @data_set = params[:data_set].to_i

    case @data_set
    when 0
      @object = ArtistName.seek(@search_term) || ReleaseName.seek(@search_term)
    when 1
      @object = WmgTalent.seek(@search_term) || WmgArtist.seek(@search_term)
    end

    if @object.blank?
      status    = 0
      descr     = "no data set returned"
      data      = nil
    else
      status    = 1
      descr     = "OK"
      data = @object.origin(@depth)
    end
    data
  end
  

  def self.aa
    data =DataSet.d7
    dest = Array.new
    
    data.each_index do |pos|
      data[pos] = value
      
      new_pos = NodeTools.seek(data, value[:id])
      if new_pos.blank?
        dest << value
      else
        node = dest[pos]
        #if adjacencies
      end
      dest
    end
  end
  
  def self.echo str
    Rails.logger.debug str
    puts str
  end

  def self.fix
    index=0
    CSV.foreach("/Users/robertjenkins/Desktop/fixer.csv") do |row|
      puts index+=1
      prod = WmgProduct.find(row[0])
      prod.project_id=row[2]
      prod.save
    end
  end
  
  def self.tra
    #Debug.wmggd.
  end
  
  
  def self.d
    params = {:depth=>"7", :filters =>"asset,product,work,contract,rights", :data_set =>"0", :id =>"green day"}
    @depth = params[:depth].to_i
    @filters = params[:filters] unless params[:filters].blank?
    @search_term = params[:id]
    @data_set = params[:data_set].to_i
    
    case @data_set
    when 0
      @object = ArtistName.seek(@search_term) || ReleaseName.seek(@search_term)
    when 1
      @object = WmgTalent.seek(@search_term) || WmgArtist.seek(@search_term)
    end
    
    data  = @object.origin(@depth)
    data
  end
  
  def self.f
    filters = ["asset","product","work","contract","rights"]
    data = NodeFilter.new(DataSet.d7).filter(filters)
    #data
  end
  
  def out    
    @filters = ["project","work"]
    @ancestors = Hash.new
    @to_replace = Hash.new
    
    
    @filters.each do |filter|
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
    return ancestor(@ancestors[ancestor_type]) if @filters.include?(ancestor_type)
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
  
  def self.dddd
    Debug.wmgbja.origin(5)
  end
  

end

class TableMaker < ActiveRecord::Migration
  # name should be plural
  # i.e.: name = 'chickens'
  def self.create_with(name)  
    create_table name.to_sym do |t|
      t.string :text, :limit => 1024
    end
    model_file = File.join("app", "models", name.singularize+".rb")
    model_name = name.singularize.capitalize
    File.open(model_file, "w+") do |f|
      f << "class #{model_name} < ActiveRecord::Base\nend"
    end
  end
  
  
  
  def self.bar(name, &block)  
    create_table name.to_sym do
      yield
    end
    model_file = File.join("app", "models", name.singularize+".rb")
    model_name = name.singularize.capitalize
    File.open(model_file, "w+") do |f|
      f << "class #{model_name} < ActiveRecord::Base\nend"
    end
  end
  
  
  def self.drop_with(name, delete_file=false)
    drop_table name.to_sym
    model_file = File.join("app", "models", name.singularize+".rb")
    File.delete(model_file) if delete_file
  end
  

  

end
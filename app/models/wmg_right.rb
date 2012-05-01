class WmgRight < ActiveRecord::Base
  include NodeTools
  include GcdmAssociations

  def name
    "#{self.right_type} - #{permission_type}"
  end

  
  def response(depth=0)
    self.data
  end
end

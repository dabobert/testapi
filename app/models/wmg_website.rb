class WmgWebsite < ActiveRecord::Base
  include GcdmAssociations
  
  self.primary_key = 'talent_website_id'
end
